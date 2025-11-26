```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucyh-15nu0hi"
modified = 2025-11-25T22:36:00.665Z
upstream = ["CVE-2023-3428"]
references = ["https://access.redhat.com/security/cve/CVE-2023-3428", "https://bugzilla.redhat.com/show_bug.cgi?id=2218369", "https://access.redhat.com/security/cve/CVE-2023-3428", "https://bugzilla.redhat.com/show_bug.cgi?id=2218369"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.1+1"]

[[jlsec_sources]]
id = "CVE-2023-3428"
imported = 2025-11-25T22:36:00.665Z
modified = 2024-11-21T08:17:14.803Z
published = 2023-10-04T19:15:10.277Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-3428"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-3428"
```

# A heap-based buffer overflow vulnerability was found in coders/tiff.c in ImageMagick

A heap-based buffer overflow vulnerability was found  in coders/tiff.c in ImageMagick. This issue may allow a local attacker to trick the user into opening a specially crafted file, resulting in an application crash and denial of service.

