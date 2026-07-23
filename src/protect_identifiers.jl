# Protect identifier-like tokens in imported plaintext advisory details.
#
# Upstream sources like NVD and EUVD provide advisory descriptions as
# plain text, but the website (../web) renders `details` as Markdown via
# Franklin.  That mangles bare identifiers -- intraword `_`/`*` become
# emphasis (`result_is_int` -> "result*is*int", often bleeding across
# adjacent identifiers) -- and a few tokens break the build outright
# (`\command` -> undefined LaTeX, `$VAR` -> math mode).
#
# `protect_identifiers` wraps the offending tokens in backticks so the
# text renders as code.  GitHub (GHSA) descriptions are authored in
# Markdown and are deliberately NOT run through this.

# A run of identifier characters, optionally ending in an empty call "()".
# The class includes `\` and `$` so that whole tokens such as `C:\etc` and
# `$HOME/.terminfo` are captured (and then wrapped) intact, and may start
# with `/` so absolute paths like `/etc/passwd` keep their leading slash.
# The lookarounds keep a wrap from starting mid-token or abutting a backtick
# or a `\x00` mask placeholder (see `_protect_line`) -- inserting a backtick
# against an existing span would produce a broken ``-delimited code block.
const _IDENTIFIER_RUN = r"(?<![`\x00A-Za-z0-9_$\\./:\-])[/A-Za-z0-9_$\\][A-Za-z0-9_$\\./:\-]*(?:\(\))?(?![`\x00])"

# True for identifiers Franklin would otherwise mangle or choke on, plus
# path-like tokens that read better as code even when they'd render fine.
function _needs_backticks(tok)
    occursin(r"^_[A-Za-z0-9]+_$", tok) && return false  # intended single-word _emphasis_
    occursin('_', tok)               && return true     # foo_bar -> foo*bar* emphasis
    occursin(r"\\[A-Za-z]", tok)     && return true     # \command -> undefined LaTeX (build error)
    occursin(r"\$[A-Za-z{]", tok)    && return true     # $VAR -> math mode (build error)
    if occursin('/', tok) && (startswith(tok, "/") || occursin('.', tok))
        # a path: absolute (/etc/shadow, /tmp) or dotted (libavcodec/utils.c) --
        # but not a protocol version (HTTP/1.0), whose last segment has no letter
        occursin(r"[A-Za-z]", last(split(tok, '/'))) && return true
    end
    return false                                        # bare \0, currency $5, etc. are harmless
end

function _backtick_token(matched)
    tok = String(matched)
    trail = ""
    if !endswith(tok, "()")
        while !isempty(tok) && last(tok) in ('.', ',', ':', ';')  # keep sentence punctuation outside
            trail = string(last(tok), trail)
            tok = chop(tok)
        end
    end
    (isempty(tok) || !_needs_backticks(tok)) && return string(tok, trail)
    return string('`', tok, '`', trail)
end

_backtick_prose(seg) = replace(seg, _IDENTIFIER_RUN => _backtick_token)

function _protect_line(line)
    masks = String[]
    mask = function (m)
        push!(masks, String(m))
        return "\x00$(length(masks) - 1)\x00"
    end
    line = replace(line, r"`[^`]*`" => mask)                 # inline code spans
    line = replace(line, r"!?\[[^\]]*\]\([^)]*\)" => mask)   # Markdown links / images
    line = replace(line, r"<https?://[^>]+>" => mask)         # autolinks
    line = replace(line, r"https?://\S+" => mask)             # bare URLs
    # Intended _emphasis_ spans (word-bounded, possibly multi-word, as in the
    # GHSA template's "_What kind of vulnerability is it?_") — leave them be.
    line = replace(line, r"(?<![A-Za-z0-9_])_[^_\x00]+_(?![A-Za-z0-9_])" => mask)
    line = _backtick_prose(line)
    # Restore in reverse order: an outer mask (e.g. a link) may embed the
    # placeholder of an inner mask (e.g. a code span in its link text), so
    # the higher-indexed mask must be expanded before the lower-indexed one.
    for i in length(masks):-1:1
        line = replace(line, "\x00$(i - 1)\x00" => masks[i])
    end
    return line
end

"""
    protect_identifiers(details) -> String

Wrap identifier-like tokens (including path-like tokens such as
`/etc/passwd` or `libavcodec/utils.c`) in plaintext advisory `details`
with backticks so they render as code rather than being mis-parsed as
Markdown by the website generator.  Prose only: inline code spans, fenced/indented code
blocks, headings, Markdown links, and bare URLs are left untouched, the
intended word-bounded `_emphasis_` spans and harmless tokens like `\\0` or
currency `\$5` are left alone, and the transform is idempotent.

`nothing` passes through unchanged, for callers whose details are optional.
"""
function protect_identifiers(details::AbstractString)
    out = String[]
    infence = false
    for line in split(details, '\n')
        st = lstrip(line)
        if startswith(st, "```") || startswith(st, "~~~")
            infence = !infence
            push!(out, line)
            continue
        end
        if infence || startswith(st, "#") || startswith(line, "    ")
            push!(out, line)
            continue
        end
        push!(out, _protect_line(line))
    end
    return join(out, '\n')
end
protect_identifiers(::Nothing) = nothing
