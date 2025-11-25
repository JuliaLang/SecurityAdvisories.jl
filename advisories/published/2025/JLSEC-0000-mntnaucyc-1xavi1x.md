```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucyc-1xavi1x"
modified = 2025-11-25T22:36:00.660Z
upstream = ["CVE-2023-3195"]
references = ["https://access.redhat.com/security/cve/CVE-2023-3195", "https://bugzilla.redhat.com/show_bug.cgi?id=2214141", "https://github.com/ImageMagick/ImageMagick/commit/f620340935777b28fa3f7b0ed7ed6bd86946934c", "https://github.com/ImageMagick/ImageMagick6/commit/85a370c79afeb45a97842b0959366af5236e9023", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/45DUUXYMAEEAW55GSLAXN25VPKCRAIDA/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4UFQJCYJ23HWHNDOVKBHZQ7HCXXL6MM3/", "https://www.openwall.com/lists/oss-security/2023/05/29/1", "https://access.redhat.com/security/cve/CVE-2023-3195", "https://bugzilla.redhat.com/show_bug.cgi?id=2214141", "https://github.com/ImageMagick/ImageMagick/commit/f620340935777b28fa3f7b0ed7ed6bd86946934c", "https://github.com/ImageMagick/ImageMagick6/commit/85a370c79afeb45a97842b0959366af5236e9023", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/45DUUXYMAEEAW55GSLAXN25VPKCRAIDA/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4UFQJCYJ23HWHNDOVKBHZQ7HCXXL6MM3/", "https://www.openwall.com/lists/oss-security/2023/05/29/1"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2023-3195"
imported = 2025-11-25T22:36:00.660Z
modified = 2024-11-21T08:16:40.133Z
published = 2023-06-16T20:15:09.547Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-3195"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-3195"
```

# A stack-based buffer overflow issue was found in ImageMagick's coders/tiff.c

A stack-based buffer overflow issue was found in ImageMagick's coders/tiff.c. This flaw allows an attacker to trick the user into opening a specially crafted malicious tiff file, causing an application to crash, resulting in a denial of service.

