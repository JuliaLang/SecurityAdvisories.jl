```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucwp-1lhcpbz"
modified = 2025-11-25T22:36:00.601Z
upstream = ["CVE-2020-25664"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1891605", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/Z3J6D7POCQYQKNVRDYLTTPM5SQC3WVTR/", "https://bugzilla.redhat.com/show_bug.cgi?id=1891605", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/Z3J6D7POCQYQKNVRDYLTTPM5SQC3WVTR/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-25664"
imported = 2025-11-25T22:36:00.601Z
modified = 2024-11-21T05:18:23.840Z
published = 2020-12-08T21:15:12.497Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-25664"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-25664"
```

# In WriteOnePNGImage() of the PNG coder at coders/png.c, an improper call to AcquireVirtualMemory() a...

In WriteOnePNGImage() of the PNG coder at coders/png.c, an improper call to AcquireVirtualMemory() and memset() allows for an out-of-bounds write later when PopShortPixel() from MagickCore/quantum-private.h is called. The patch fixes the calls by adding 256 to rowbytes. An attacker who is able to supply a specially crafted image could affect availability with a low impact to data integrity. This flaw affects ImageMagick versions prior to 6.9.10-68 and 7.0.8-68.

