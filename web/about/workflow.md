# Advisory Publication Workflow

This page documents the complete workflow for security advisories in the Julia ecosystem, from initial discovery through publication and distribution. All advisories are proposed, reviewed, edited, and published through a typical GitHub pull request workflow; see [contributing](about/contributing.md) for more details.

There are three key stages in the lifecycle of an advisory: identification, review, and publication.

## Discovery and identification

Security advisories are the notification mechanism for _downstream consumers_ of vulnerable packages. They are not meant to alert package maintainers of issues.

Report any potentially-exploitable security issues privately, either following the applicable security policy (if there is one), contacting the maintainer(s) directly, or by mailing security@julialang.org. A coordinated disclosure with a reserved identifier can be privately organized if necessary.

Once an issue has been publicly identified, fixed, and/or otherwise published, then it can be publicly proposed for inclusion in the database by opening a pull request.  This process can either be done [manually](about/contributing.md) or automatically.

### Automatic identification

There are other global databases in which a security advisory that affects a Julia package may be published — examples include MITRE's CVEs and GitHub's GHSAs. The tooling in SecurityAdvisories.jl aims to automatically identify such advisories and propose their inclusion as first-class JLSEC advisories.

There are two key types of JLSEC advisory and the distinction is subtle but important, particularly when referencing another database:

* The **originating** and/or **aliasing** advisory: the JLSEC is itself the announcement of the issue or it is helping publicize an advisory from another database that directly concerns a Julia package (either retroactively or through a coordinated disclosure).
* The **upstream** advisory: the JLSEC represents that a Julia package is directly re-distributing a **non-Julia** project that's named in an advisory from another database (typically through an [Artifact](https://pkgdocs.julialang.org/v1/artifacts/)).

Aliasing advisories are typically easier to find, identify, and automatically propose; they are reports directly against a Julia package and thus will either be posted directly as a repository GHSA or will include the package name (often with a `.jl` suffix) within its description.

Upstream advisories require significantly more effort and are, unfortunately, far more common. They first require an understanding of what upstream components are contained within a particular Julia package — and at what version — before the corresponding JLSEC can even be proposed. This tracking of upstream components is not trivial and is the purview of [GeneralMetadata.jl](https://github.com/JuliaRegistries/GeneralMetadata.jl).

## Review

Proposed advisories (and changes thereof) are reviewed through the public pull requests. The most crucial data here are the package names and vulnerable versions. For the automatically-proposed aliasing advisories these are often correct, but extra care must be taken for upstream advisories to ensure that GeneralMetadata has its versioning data correct.

The automated CI systems perform a dry-run of the final publication and verify the identifier, timestamps, and schema.

## Publication and export

The `main` branch serves as the canonical source version of all `advisories`, and the `generated/osv` branch serves as the canonical _publication_ from which any downstream data consumers should pull.

Upon merging changes to `main` an automated action will update all identifiers and timestamps (as necessary) and publish the updates to `generated/osv`.
