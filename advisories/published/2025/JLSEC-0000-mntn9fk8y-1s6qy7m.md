```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntn9fk8y-1s6qy7m"
modified = 2025-11-25T21:56:30.658Z
upstream = ["CVE-2023-30775"]
references = ["https://access.redhat.com/security/cve/CVE-2023-30775", "https://bugzilla.redhat.com/show_bug.cgi?id=2187141", "https://gitlab.com/libtiff/libtiff/-/issues/464", "https://security.netapp.com/advisory/ntap-20230703-0002/", "https://access.redhat.com/security/cve/CVE-2023-30775", "https://bugzilla.redhat.com/show_bug.cgi?id=2187141", "https://gitlab.com/libtiff/libtiff/-/issues/464", "https://security.netapp.com/advisory/ntap-20230703-0002/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = [">= 4.4.0+0, < 4.5.1+0"]

[[jlsec_sources]]
id = "CVE-2023-30775"
imported = 2025-11-25T21:56:30.658Z
modified = 2025-01-21T18:15:13.483Z
published = 2023-05-19T15:15:08.980Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-30775"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-30775"
```

# A vulnerability was found in the libtiff library

A vulnerability was found in the libtiff library. This security flaw causes a heap buffer overflow in extractContigSamples32bits, tiffcrop.c.

