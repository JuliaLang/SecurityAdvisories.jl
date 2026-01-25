using Documenter
using SecurityAdvisories
using Dates

# =============================================================================
# Phase 2: Foundational - Advisory Parsing and Transformation
# =============================================================================

"""
    load_all_advisories(base_path)

Scan advisories/published/ and load all advisory files.
Returns a Dict{Int, Vector{Advisory}} grouped by year.
"""
function load_all_advisories(base_path::String)
    published_dir = joinpath(base_path, "advisories", "published")
    advisories_by_year = Dict{Int, Vector{SecurityAdvisories.Advisory}}()

    for year_dir in readdir(published_dir)
        year_path = joinpath(published_dir, year_dir)
        isdir(year_path) || continue

        year = tryparse(Int, year_dir)
        isnothing(year) && continue

        advisories_by_year[year] = SecurityAdvisories.Advisory[]

        for advisory_file in readdir(year_path)
            endswith(advisory_file, ".md") || continue

            filepath = joinpath(year_path, advisory_file)
            try
                adv = SecurityAdvisories.parsefile(filepath)
                push!(advisories_by_year[year], adv)
            catch e
                @warn "Failed to parse advisory: $filepath" exception=e
            end
        end

        # Sort advisories within each year by ID
        sort!(advisories_by_year[year], by = a -> a.id)
    end

    return advisories_by_year
end

"""
    cve_link(alias)

Generate NVD link for a CVE alias.
"""
function cve_link(alias::String)
    return "https://nvd.nist.gov/vuln/detail/$alias"
end

"""
    ghsa_link(alias, sources)

Generate GitHub Security Advisory link for a GHSA alias.
Uses html_url from jlsec_sources if available.
"""
function ghsa_link(alias::String, sources::Vector)
    # Try to find html_url from sources
    for src in sources
        if src.id == alias && !isempty(src.html_url)
            return src.html_url
        end
    end
    # Fallback to generic GitHub advisories URL
    return "https://github.com/advisories/$alias"
end

"""
    format_alias_link(alias, sources)

Format an alias as a markdown link to its external database.
"""
function format_alias_link(alias::String, sources::Vector)
    if startswith(alias, "CVE-")
        return "[$(alias)]($(cve_link(alias)))"
    elseif startswith(alias, "GHSA-")
        return "[$(alias)]($(ghsa_link(alias, sources)))"
    else
        return alias  # Return as-is for unknown alias types
    end
end

"""
    format_date(dt)

Format a DateTime for display.
"""
function format_date(dt::Union{DateTime, Nothing})
    isnothing(dt) && return "N/A"
    return Dates.format(dt, "yyyy-mm-dd")
end

"""
    advisory_to_markdown(adv)

Transform an Advisory into Documenter-compatible markdown content.
"""
function advisory_to_markdown(adv::SecurityAdvisories.Advisory)
    io = IOBuffer()

    # Title with withdrawn indicator
    is_withdrawn = !isnothing(adv.withdrawn)
    if is_withdrawn
        println(io, "# $(adv.id) [WITHDRAWN]")
        println(io)
        println(io, "!!! warning \"This advisory has been withdrawn\"")
        println(io, "    This advisory was withdrawn on $(format_date(adv.withdrawn)).")
        println(io)
    else
        title = isnothing(adv.summary) ? adv.id : "$(adv.id): $(adv.summary)"
        println(io, "# $title")
    end
    println(io)

    # Packages line for search indexing
    packages = [v.pkg for v in adv.affected if SecurityAdvisories.is_vulnerable(v)]
    if !isempty(packages)
        println(io, "**Packages:** $(join(packages, ", "))")
        println(io)
    end

    # Metadata table
    println(io, "## Metadata")
    println(io)
    println(io, "| Field | Value |")
    println(io, "|-------|-------|")
    println(io, "| **ID** | $(adv.id) |")
    println(io, "| **Published** | $(format_date(adv.published)) |")
    println(io, "| **Modified** | $(format_date(adv.modified)) |")

    # Aliases with links
    if !isempty(adv.aliases)
        alias_links = [format_alias_link(a, adv.jlsec_sources) for a in adv.aliases]
        println(io, "| **Aliases** | $(join(alias_links, ", ")) |")
    end

    # Severity if present
    if !isempty(adv.severity)
        scores = [s.score for s in adv.severity]
        println(io, "| **Severity** | $(join(scores, ", ")) |")
    end

    if is_withdrawn
        println(io, "| **Withdrawn** | $(format_date(adv.withdrawn)) |")
    end
    println(io)

    # Affected packages table
    vulnerable = filter(SecurityAdvisories.is_vulnerable, adv.affected)
    if !isempty(vulnerable)
        println(io, "## Affected Packages")
        println(io)
        println(io, "| Package | Vulnerable Versions |")
        println(io, "|---------|---------------------|")
        for v in vulnerable
            ranges_str = join(string.(v.ranges), ", ")
            println(io, "| $(v.pkg) | $ranges_str |")
        end
        println(io)
    end

    # Original content (summary already in title, include details)
    if !isnothing(adv.details) && !isempty(adv.details)
        # The details may already have markdown headers, include as-is
        println(io, adv.details)
        println(io)
    end

    # References section
    if !isempty(adv.references)
        println(io, "## References")
        println(io)
        for ref in adv.references
            println(io, "- [$(ref.url)]($(ref.url))")
        end
        println(io)
    end

    # Credits section
    if !isempty(adv.credits)
        println(io, "## Credits")
        println(io)
        for credit in adv.credits
            println(io, "- $(credit.name)")
        end
        println(io)
    end

    # Sources section (for imported advisories)
    if !isempty(adv.jlsec_sources)
        println(io, "## Sources")
        println(io)
        for src in adv.jlsec_sources
            println(io, "- [$(src.id)]($(src.html_url)) (imported $(format_date(src.imported)))")
        end
        println(io)
    end

    return String(take!(io))
end

# =============================================================================
# Phase 3: User Story 1 - Browse All Advisories (Index Generation)
# =============================================================================

"""
    generate_advisory_pages(advisories_by_year, docs_src_dir)

Generate individual advisory markdown files in docs/src/advisories/{year}/
"""
function generate_advisory_pages(advisories_by_year::Dict, docs_src_dir::String)
    advisories_dir = joinpath(docs_src_dir, "advisories")
    mkpath(advisories_dir)

    pages_by_year = Dict{Int, Vector{Pair{String,String}}}()

    for year in sort(collect(keys(advisories_by_year)), rev=true)
        year_dir = joinpath(advisories_dir, string(year))
        mkpath(year_dir)

        pages_by_year[year] = Pair{String,String}[]

        for adv in advisories_by_year[year]
            # Generate markdown content
            content = advisory_to_markdown(adv)

            # Write to file
            filename = "$(adv.id).md"
            filepath = joinpath(year_dir, filename)
            write(filepath, content)

            # Add to pages list
            title = isnothing(adv.summary) ? adv.id : "$(adv.id): $(first(adv.summary, 50))$(length(adv.summary) > 50 ? "..." : "")"
            push!(pages_by_year[year], title => joinpath("advisories", string(year), filename))
        end

        # Reverse to show newest first within year (assuming IDs are sequential)
        reverse!(pages_by_year[year])
    end

    return pages_by_year
end

"""
    generate_advisories_index(advisories_by_year, docs_src_dir)

Generate the main advisories index page grouped by year.
"""
function generate_advisories_index(advisories_by_year::Dict, docs_src_dir::String)
    io = IOBuffer()

    println(io, "# Security Advisories")
    println(io)
    println(io, "Browse all security advisories affecting Julia packages, organized by year.")
    println(io)

    total_count = sum(length.(values(advisories_by_year)))
    println(io, "**Total advisories:** $total_count")
    println(io)

    for year in sort(collect(keys(advisories_by_year)), rev=true)
        advisories = advisories_by_year[year]
        println(io, "## $year ($(length(advisories)) advisories)")
        println(io)

        for adv in reverse(advisories)  # Newest first
            is_withdrawn = !isnothing(adv.withdrawn)
            packages = join([v.pkg for v in adv.affected if SecurityAdvisories.is_vulnerable(v)], ", ")
            title = isnothing(adv.summary) ? "" : " - $(first(adv.summary, 60))$(length(something(adv.summary, "")) > 60 ? "..." : "")"

            if is_withdrawn
                println(io, "- ~~[$(adv.id)](advisories/$(year)/$(adv.id).md)$title~~ (WITHDRAWN)")
            else
                println(io, "- [$(adv.id)](advisories/$(year)/$(adv.id).md)$title")
                if !isempty(packages)
                    println(io, "  - Packages: $packages")
                end
            end
        end
        println(io)
    end

    filepath = joinpath(docs_src_dir, "advisories.md")
    write(filepath, String(take!(io)))
end

# =============================================================================
# Phase 5: User Story 3 - Search by Package (Packages Index)
# =============================================================================

"""
    generate_packages_index(advisories_by_year, docs_src_dir)

Generate the packages index page listing all affected packages.
"""
function generate_packages_index(advisories_by_year::Dict, docs_src_dir::String)
    # Collect all packages and their advisories
    packages = Dict{String, Vector{Tuple{String, Int, String}}}()  # pkg -> [(id, year, summary)]

    for (year, advisories) in advisories_by_year
        for adv in advisories
            isnothing(adv.withdrawn) || continue  # Skip withdrawn
            for v in adv.affected
                SecurityAdvisories.is_vulnerable(v) || continue
                pkg = v.pkg
                if !haskey(packages, pkg)
                    packages[pkg] = Tuple{String, Int, String}[]
                end
                push!(packages[pkg], (adv.id, year, something(adv.summary, "")))
            end
        end
    end

    io = IOBuffer()

    println(io, "# Packages Index")
    println(io)
    println(io, "Find security advisories by affected package name.")
    println(io)
    println(io, "**Total packages with advisories:** $(length(packages))")
    println(io)

    println(io, "## Packages")
    println(io)
    println(io, "| Package | Advisory Count | Advisories |")
    println(io, "|---------|----------------|------------|")

    for pkg in sort(collect(keys(packages)))
        advisories = packages[pkg]
        count = length(advisories)
        links = ["[$(id)](advisories/$(year)/$(id).md)" for (id, year, _) in advisories]
        println(io, "| **$pkg** | $count | $(join(links, ", ")) |")
    end
    println(io)

    filepath = joinpath(docs_src_dir, "packages.md")
    write(filepath, String(take!(io)))
end

# =============================================================================
# Build Configuration
# =============================================================================

# Get the repository root (parent of docs/)
const REPO_ROOT = dirname(@__DIR__)
const DOCS_SRC = joinpath(@__DIR__, "src")

# Load all advisories
println("Loading advisories...")
advisories_by_year = load_all_advisories(REPO_ROOT)
total = sum(length.(values(advisories_by_year)))
println("Loaded $total advisories across $(length(advisories_by_year)) years")

# Generate advisory pages
println("Generating advisory pages...")
pages_by_year = generate_advisory_pages(advisories_by_year, DOCS_SRC)

# Generate index pages
println("Generating index pages...")
generate_advisories_index(advisories_by_year, DOCS_SRC)
generate_packages_index(advisories_by_year, DOCS_SRC)

# Build the pages array for Documenter
advisory_pages = []
for year in sort(collect(keys(pages_by_year)), rev=true)
    push!(advisory_pages, "$year" => pages_by_year[year])
end

println("Building documentation...")
makedocs(
    sitename = "Julia Security Advisories",
    authors = "JuliaLang Security Team",
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true",
        canonical = "https://julialang.github.io/SecurityAdvisories.jl/",
        assets = ["assets/custom.css"],
    ),
    pages = [
        "Home" => "index.md",
        "Advisories" => [
            "Overview" => "advisories.md",
            advisory_pages...
        ],
        "Packages" => "packages.md",
        "About" => "about.md",
    ],
)

# Deploy to GitHub Pages (only in CI)
if get(ENV, "CI", nothing) == "true"
    deploydocs(
        repo = "github.com/JuliaLang/SecurityAdvisories.jl.git",
        devbranch = "main",
        push_preview = true,
    )
end
