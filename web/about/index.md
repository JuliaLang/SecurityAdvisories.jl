@def title = "About"

~~~<div class="about-content">~~~

# About

The Julia Ecosystem Security Advisory Database is the canonical source of security advisories for packages in the [Julia](https://julialang.org) ecosystem. It covers all packages registered in the [General registry](https://github.com/JuliaRegistries/General), the Julia standard libraries, and Julia itself.

## Goals

- Be the database of security advisories for the Julia package ecosystem
- Provide structure for authoring, reviewing, and maintaining advisories
- Export advisories in the standard [OSV format](https://ossf.github.io/osv-schema/) for downstream consumers
- Search and import applicable advisories from upstream databases (NVD, EUVD, GitHub)

## Contributing

Anyone can submit or update advisories via pull request. See the [contributing guide](/about/contributing/) for details, the [advisory schema](/about/schema/) for the file format, and the [publication workflow](/about/workflow/) for an overview of the full advisory lifecycle. Report any potentially-exploitable security issues privately, either following the package security policy (if it has one), contacting the maintainer(s) directly, or by mailing `security@julialang.org`.

## Data Export

All advisories are automatically exported to [OSV-compliant JSON](https://ossf.github.io/osv-schema/) on the `generated/osv` branch. Pull request CI validates the conversion before merging.

## Links

- [GitHub Repository](https://github.com/JuliaLang/SecurityAdvisories.jl)
- [OSV Schema Specification](https://ossf.github.io/osv-schema/)
- [Julia Language](https://julialang.org)

~~~</div>~~~
