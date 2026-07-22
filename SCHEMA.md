# The database

Security advisories against packages in the [Julia General registry](https://github.com/JuliaRegistries/General) are published in the `advisories/published` directory of this repository, grouped by year, with filenames corresponding to their uniquely assigned identifier. All published advisories have an identifier of `JLSEC-YYYY-nnn`, and are stored as Markdown files with a TOML "front-matter" section with structured metadata.

## Advisory schema (Markdown+TOML)

Each advisory is canonically stored and edited as a Markdown file with TOML frontmatter, identified by a `JLSEC-YYYY-NNN` identifier. Fields follow the [OSV schema](https://ossf.github.io/osv-schema/) with a few ergonomic shorthands:

* The `summary` is the (optional) header immediately following the frontmatter.
* The `details` are the remainder of the file.
* All other fields defined in the TOML frontmatter, as a ```` ```toml ```` block:
    * The `affected` packages are stored much more succinctly as an array of tables with each package's name (`pkg`) and vulnerable `ranges`. The ranges themselves are vectors of strings, using [GitHub's vulnerable version range (VVR) syntax](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/best-practices-for-writing-repository-security-advisories#affected-versions). The package names are exactly as they appear in the General registry, without the conventional `.jl` suffix.
    * Timestamps are stored directly as TOML datetimes, not as strings.
    * OSV's `credits`, `references`, and `severities` are all canonically arrays of tables with multiple fields, but JLSEC supports specifying typical entries as a single string:
        * Credits can use a shorthand `"Author Name <author@example.com>"` for the common cases where no credit type is assigned and there is only one email-based contact method
        * References can contain URLs directly; these become `WEB` reference types
        * Severities can contain the CVSS string itself
    * Any additional fields whose names start with `jlsec_` are placed into `database_specific` (with the prefix removed). Currently there is only one supported database specific field, `jlsec_sources`, which stores information about the database(s) from which the advisory was imported (if imported).

<details><summary>In practice, a valid JLSEC advisory looks like this:</summary>

````md
```toml
schema_version = "1.7.4"
id = "JLSEC-2025-1"
modified = 2025-09-23T02:23:16.095Z
published = 2025-09-23T02:23:16.095Z
aliases = ["GHSA-4g68-4pxg-mw93", "CVE-2025-52479"]

[[affected]]
pkg = "HTTP"
ranges = ["<= 1.10.16"]
[[affected]]
pkg = "URIs"
ranges = ["< 1.6.0"]

[[jlsec_sources]]
html_url = "https://github.com/JuliaWeb/HTTP.jl/security/advisories/GHSA-4g68-4pxg-mw93"
id = "GHSA-4g68-4pxg-mw93"
imported = 2025-09-23T02:06:09.198Z
modified = 2025-06-24T23:01:25Z
published = 2025-06-24T23:01:25Z
url = "https://api.github.com/repos/JuliaWeb/HTTP.jl/security-advisories/GHSA-4g68-4pxg-mw93"
```

# CR/LF injection in URIs.jl (also affects HTTP.jl)

### Description

The URIs.jl and HTTP.jl packages allowed the construction of URIs containing CR/LF characters. If user input was not otherwise escaped or protected, this can lead to a CRLF injection attack.
````

</details>

## Advisory schema (JSON)

The [`generated/osv` branch](https://github.com/JuliaLang/SecurityAdvisories.jl/tree/generated/osv) provides the exact same data in valid [OSV schema](https://ossf.github.io/osv-schema/) JSON files, grouped by year. These are intended for use by downstream tooling.
