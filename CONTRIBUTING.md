# Reporting New Julia Ecosystem Vulnerabilities

Report any potentially-exploitable security issues privately, either following the package security policy (if it has one), contacting the maintainer(s) directly, or by mailing security@julialang.org.

Security advisories are the _notification_ mechanism for downstream consumers, and they are most effective when they have a clear upgrade path or alternative.

## Creating a new JLSEC advisory

To create a new advisory, open a pull request with the file `advisories/published/JLSEC-0000-0.md`; the ID will automatically be generated upon publication. To reserve an identifer for coordinated and responsible disclosure, place that (empty) file in `advisories/reserved` instead. Advisories are markdown files with a toml frontmatter section defining fields according to the OSV schema; see [the format documentation](/about) for more details.

The pull request GitHub actions will do a dry-run of the publication and export to ensure the ID and all timestamps will be appropriately populated upon merge. You can preview how these actions update your TOML (and exported OSV) files within the GitHub action outputs.

In many cases, you don't need to create an advisory from scratch. Package maintainers that use GitHub hosting can directly issue security advisories on the repository's "Security" tab. Once issued, these GitHub security advisories (GHSAs) can be directly imported here (as _aliases_). Open an issue here to request its import.

Other Julia packages may need to issue advisories because they are directly redistributing upstream components that have themselves issued advisories. This is a common case for JLLs — they issue advisories for the _upstream_ vulnerabilities they contain. These data are vast, and ensuring all JLLs are accurately representing their upstream vulnerabilities is a long-tail problem. If there's a package you know isn't reporting an upstream vulnerability, you can open an issue here directly. It may be that it simply hasn't been imported yet, or it may be that its components aren't yet well-tracked by [GeneralMetadata.jl](https://github.com/mbauman/GeneralMetadata.jl).

## Updating an already-published advisory

Anyone can update advisories! Good updates can include further population of the structured fields, grammatical and spelling improvements, and technical reviews. Upon every change, the modified dates will be appropriately bumped upon merge to master.  Check out [osv.dev's properties of a high-quality OSV record](https://google.github.io/osv.dev/data_quality.html) for some more inspiration and guidance.

Advisories should never be deleted. If an advisory was found to be issued in error, open a pull request that sets the `withdrawn` date to the current time.

## Other contributions

In addition to the database of `advisories`, SecurityAdvisories.jl is itself a Julia package with source code to help manage the database. In particular, there is significant tooling to search and import advisories from other advisory databases. Contributions to this tooling are welcome, too!

## FAQ

**Q:** Do I need to be the owner or maintainer of a package to file an advisory?

**A:** No, anyone can propose publishing an advisory against any package. If, however, it has not yet been publicly reported, please follow responsible disclosure best-practices.

**Q:** Is there a mechanism here to handle embargoed vulnerabilities?

**A:** A JLSEC identifier may be reserved by placing an empty file of the appropriate name in the `advisories/reserved/` directory. SecurityVulnerabilities.jl itself does not have a mechanism to facilitate private discussions; those should occur directly with package maintainers or, for high-impact vulnerabilities, security@julialang.org.
