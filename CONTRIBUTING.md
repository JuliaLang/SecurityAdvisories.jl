# Reporting New Julia Ecosystem Vulnerabilities

Report any potentially-exploitable security issues privately, either following the package security policy (if it has one), contacting the maintainer(s) directly, or by mailing security@julialang.org.

Security advisories are the _notification_ mechanism for downstream consumers, and they are most effective when they have a clear upgrade path or alternative.

## Creating a new JLSEC advisory

To create a new advisory, open a pull request with the file `advisories/published/JLSEC-0000-0.md`; the ID will automatically be generated upon publication. To reserve an identifier for coordinated and responsible disclosure, place that (empty) file in `advisories/reserved` instead. Advisories are Markdown files with a TOML frontmatter section defining fields according to the OSV schema; see [the format documentation](SCHEMA.md) for more details.

The pull request GitHub actions will do a dry-run of the publication and export to ensure the ID and all timestamps will be appropriately populated upon merge. You can preview how these actions update your TOML (and exported OSV) files within the GitHub action outputs.

In many cases, you don't need to create an advisory from scratch. Package maintainers that use GitHub hosting can directly issue security advisories on the repository's "Security" tab. Once issued, these GitHub security advisories (GHSAs) can be directly imported here (as _aliases_). Open an issue here to request an import.

Other Julia packages may need to issue advisories because they are directly redistributing upstream components that have themselves issued advisories. This is a common case for JLLs — they issue advisories for the _upstream_ vulnerabilities they contain. These data are vast, and ensuring all JLLs are accurately representing their upstream vulnerabilities is a long-tail problem. If there's a package you know isn't reporting an upstream vulnerability, you can open an issue here directly. It may be that it simply hasn't been imported yet, or it may be that its components aren't yet well-tracked by [GeneralMetadata.jl](https://github.com/JuliaRegistries/GeneralMetadata.jl).

## Updating an already-published advisory

Anyone can update advisories! Good updates can include further population of the structured fields, grammatical and spelling improvements, and technical reviews. Upon every change, the modified dates will be appropriately bumped upon merge to `main`.  See [osv.dev's properties of a high-quality OSV record](https://google.github.io/osv.dev/data_quality.html) for some more inspiration and guidance.

Advisories should never be deleted. If an advisory was found to be issued in error, open a pull request that sets the `withdrawn` date to the current time.

## Other contributions

In addition to the database of `advisories`, SecurityAdvisories.jl is itself a Julia package with source code to help manage the database. In particular, there is significant tooling to search and import advisories from other advisory databases. Contributions to this tooling are welcome, too!

## Rejecting an upstream advisory

The automation here continually searches upstream databases (GHSA, NVD, and EUVD) and opens pull requests that propose new advisories that match. Sometimes review determines that a proposed advisory doesn't actually apply. Just deleting it from the PR avoids publication but would lead to it being proposed again in a subsequent search.

Instead, record the rejection in [`advisories/rejected.toml`](advisories/rejected.toml). Each entry is a table keyed by the advisory's preferred upstream identifier (typically the CVE), with optional `aliases`, `packages`, and `reason` fields:

```toml
[CVE-1234-56789]
aliases = ["GHSA-xxxx-xxxx-xxxx"]  # other upstream ids for the same advisory
packages = ["Example_jll"]         # only reject it for these packages
reason = "Example_jll does not build the vulnerable code."
```

A rejection is scoped to its `packages` field. This means an advisory can be rejected for one package while remaining published for others — remove the rejected package from the published advisory's `affected` list in the same pull request that adds the entry (the tests require the two to agree). It also means that if a future search newly matches the advisory to a package that isn't listed, it is still proposed for review. Omitting `packages` rejects the advisory outright for all packages until the entry is removed, so prefer listing the assessed packages when they're known.

To deliberately import a rejected advisory, run the "Search for upstream advisories" workflow with the filter disabled (and remove or adjust its `rejected.toml` entry in the resulting pull request).

## FAQ

**Q:** Do I need to be the owner or maintainer of a package to file an advisory?

**A:** No, anyone can propose publishing an advisory against any package. If, however, it has not yet been publicly reported, please follow responsible disclosure best-practices.

**Q:** Is there a mechanism here to handle embargoed vulnerabilities?

**A:** A JLSEC identifier may be reserved by placing an empty file of the appropriate name in the `advisories/reserved/` directory. SecurityAdvisories.jl itself does not have a mechanism to facilitate private discussions; those should occur directly with package maintainers or, for high-impact vulnerabilities, security@julialang.org.
