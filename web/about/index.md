@def title = "About"

~~~<div class="about-content">~~~

# About

The Julia Security Advisory Database is the canonical source of security advisories for packages in the [Julia](https://julialang.org) ecosystem. It covers all packages registered in the [General registry](https://github.com/JuliaRegistries/General), the Julia standard libraries, and Julia itself.

## Goals

- Be the database of security advisories for the Julia package ecosystem
- Provide structure for authoring, reviewing, and maintaining advisories
- Export advisories in the standard [OSV format](https://ossf.github.io/osv-schema/) for downstream consumers
- Search and import applicable advisories from upstream databases (NVD, EUVD, GitHub)

## Advisory Format

Each advisory is a Markdown file with TOML frontmatter, identified by a `JLSEC-YYYY-NNN` identifier. Fields follow the [OSV schema](https://ossf.github.io/osv-schema/) with a few ergonomic shorthands:

* The `summary` is the header immediately following the frontmatter (if one exists).
* The `details` are the remainder of the file.
* The `affected` packages are stored much more succinctly as an array of tables with each package's name (`pkg`) and vulnerable `ranges`. The ranges themselves are vectors of strings, using [GitHub's vulnerable version range (VVR) syntax](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/best-practices-for-writing-repository-security-advisories#affected-versions).
* Timestamps are stored directly as TOML datetimes, not as strings.
* OSV's `credits`, `references`, and `severities` are all canonically arrays of tables with multiple fields, but JLSEC supports specifying typical entries as a single string:
    * Credits can use a shorthand `"Author Name <author@example.com>"` for the common cases where no credit type is assigned and there is only one email-based contact method
    * References can contain URLs directly; these become `WEB` reference types
    * Severities can contain the CVSS string itself
* Any additional fields whose names start with `jlsec_` are placed into `database_specific` (with the prefix removed).

## Contributing

Anyone can submit or update advisories via pull request. See the [contributing guide](https://github.com/JuliaLang/SecurityAdvisories.jl/blob/main/CONTRIBUTING.md) for details. For disclosure of serious issues, please email `security@julialang.org`.

## Data Export

All advisories are automatically exported to [OSV-compliant JSON](https://ossf.github.io/osv-schema/) on the `generated/osv` branch. Pull request CI validates the conversion before merging.

## Links

- [GitHub Repository](https://github.com/JuliaLang/SecurityAdvisories.jl)
- [OSV Schema Specification](https://ossf.github.io/osv-schema/)
- [Julia Language](https://julialang.org)

~~~</div>~~~
