```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnu665egq-ami4xk"
modified = 2025-12-09T03:32:15.098Z
upstream = ["CVE-2025-64182"]
references = ["https://github.com/AcademySoftwareFoundation/openexr/blob/b3a19903db0672c63055023aa788e592b16ec3c5/src/wrappers/python/PyOpenEXR_old.cpp#L528-L536", "https://github.com/AcademySoftwareFoundation/openexr/security/advisories/GHSA-vh63-9mqx-wmjr", "https://github.com/AcademySoftwareFoundation/openexr/security/advisories/GHSA-vh63-9mqx-wmjr"]

[[affected]]
pkg = "OpenEXR_jll"
ranges = [">= 3.1.4+0"]

[[jlsec_sources]]
id = "CVE-2025-64182"
imported = 2025-12-09T03:32:15.098Z
modified = 2025-12-08T15:37:24.687Z
published = 2025-11-10T22:15:37.120Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-64182"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-64182"
```

# OpenEXR provides the specification and reference implementation of the EXR file format, an image sto...

OpenEXR provides the specification and reference implementation of the EXR file format, an image storage format for the motion picture industry. In versions 3.2.0 through 3.2.4, 3.3.0 through 3.3.5, and 3.4.0 through 3.4.2, a memory safety bug in the legacy OpenEXR Python adapter (the deprecated OpenEXR.InputFile wrapper) allow crashes and likely code execution when opening attacker-controlled EXR files or when passing crafted Python objects. Integer overflow and unchecked allocation in InputFile.channel() and InputFile.channels() can lead to heap overflow (32 bit) or a NULL deref (64 bit). Versions 3.2.5, 3.3.6, and 3.4.3 contain a patch for the issue.

