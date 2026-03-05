@def title = "About"

~~~<div class="about-content">~~~

# About

The Julia Security Advisory Database is the canonical source of security advisories for packages in the [Julia](https://julialang.org) ecosystem. It covers all packages registered in the [General registry](https://github.com/JuliaRegistries/General).

## Goals

- Be the database of security advisories for the Julia package ecosystem
- Provide structure for authoring, reviewing, and maintaining advisories
- Export advisories in the standard [OSV format](https://ossf.github.io/osv-schema/) for downstream consumers
- Search and import applicable advisories from upstream databases (NVD, EUVD, GitHub)

## Advisory Format

Each advisory is a Markdown file with TOML frontmatter, identified by a `JLSEC-YYYY-NNN` identifier. Fields follow the [OSV schema](https://ossf.github.io/osv-schema/) with a few ergonomic shorthands for version ranges, credits, and references.

## Contributing

Anyone can submit or update advisories via pull request. See the [contributing guide](https://github.com/JuliaLang/SecurityAdvisories.jl/blob/main/CONTRIBUTING.md) for details.

## Data Export

All advisories are automatically exported to [OSV-compliant JSON](https://ossf.github.io/osv-schema/) on the `generated/osv` branch. Pull request CI validates the conversion before merging.

## Links

- [GitHub Repository](https://github.com/JuliaLang/SecurityAdvisories.jl)
- [OSV Schema Specification](https://ossf.github.io/osv-schema/)
- [Julia Language](https://julialang.org)

~~~</div>~~~
