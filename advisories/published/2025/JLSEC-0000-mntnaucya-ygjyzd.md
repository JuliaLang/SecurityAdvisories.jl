```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucya-ygjyzd"
modified = 2025-11-25T22:36:00.658Z
upstream = ["CVE-2023-34474"]
references = ["https://access.redhat.com/security/cve/CVE-2023-34474", "https://bugzilla.redhat.com/show_bug.cgi?id=2214148", "https://github.com/ImageMagick/ImageMagick/commit/1061db7f80fdc9ef572ac60b55f408f7bab6e1b0", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/45DUUXYMAEEAW55GSLAXN25VPKCRAIDA/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4UFQJCYJ23HWHNDOVKBHZQ7HCXXL6MM3/", "https://access.redhat.com/security/cve/CVE-2023-34474", "https://bugzilla.redhat.com/show_bug.cgi?id=2214148", "https://github.com/ImageMagick/ImageMagick/commit/1061db7f80fdc9ef572ac60b55f408f7bab6e1b0", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/45DUUXYMAEEAW55GSLAXN25VPKCRAIDA/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4UFQJCYJ23HWHNDOVKBHZQ7HCXXL6MM3/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.1+0"]

[[jlsec_sources]]
id = "CVE-2023-34474"
imported = 2025-11-25T22:36:00.658Z
modified = 2024-11-21T08:07:20.087Z
published = 2023-06-16T20:15:09.370Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-34474"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-34474"
```

# A heap-based buffer overflow issue was discovered in ImageMagick's ReadTIM2ImageData() function in c...

A heap-based buffer overflow issue was discovered in ImageMagick's ReadTIM2ImageData() function in coders/tim2.c. A local attacker could trick the user in opening specially crafted file, triggering an out-of-bounds read error, allowing an application to crash, resulting in a denial of service.

