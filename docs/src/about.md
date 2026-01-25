# About

## The Julia Security Advisory Database

This database is the official source of security advisories for packages in the Julia ecosystem. All packages in the [Julia General registry](https://github.com/JuliaRegistries/General) are within scope.

## Advisory Format

Each advisory follows the [Open Source Vulnerability (OSV) format](https://ossf.github.io/osv-schema/) with some Julia-specific extensions:

- **JLSEC ID**: Unique identifier in `JLSEC-YYYY-NNN` format
- **Affected packages**: Julia package names with version ranges using GitHub's VVR syntax
- **Aliases**: References to CVE, GHSA, and other databases
- **Sources**: Provenance information for imported advisories

## Data Sources

Advisories are sourced from:

- Direct reports to this database
- GitHub Security Advisories (GHSA) for Julia repositories
- National Vulnerability Database (NVD) CVEs mentioning Julia packages
- European Union Vulnerability Database (EUVD)

For a detailed explanation of how advisories flow through the system, see the [Workflow](workflow.md) page.

## Export Formats

All advisories are exported to JSON in valid OSV schema format on the [`generated/osv` branch](https://github.com/JuliaLang/SecurityAdvisories.jl/tree/generated/osv).

## License

Advisory data is licensed under [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/).

## Contact

For questions or to report issues, please open an issue at [JuliaLang/SecurityAdvisories.jl](https://github.com/JuliaLang/SecurityAdvisories.jl/issues).
