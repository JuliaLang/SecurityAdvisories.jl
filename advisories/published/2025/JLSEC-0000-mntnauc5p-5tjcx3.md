```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5p-5tjcx3"
modified = 2025-11-25T22:35:59.629Z
upstream = ["CVE-2016-7530"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/bugs/1539053", "https://bugs.launchpad.net/bugs/1539067", "https://bugzilla.redhat.com/show_bug.cgi?id=1378762", "https://github.com/ImageMagick/ImageMagick/commit/63346f34f9d19179599b5b256e5e8d3dda46435c", "https://github.com/ImageMagick/ImageMagick/commit/b5ed738f8060266bf4ae521f7e3ed145aa4498a3", "https://github.com/ImageMagick/ImageMagick/commit/c4e63ad30bc42da691f2b5f82a24516dd6b4dc70", "https://github.com/ImageMagick/ImageMagick/issues/105", "https://github.com/ImageMagick/ImageMagick/issues/110", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/bugs/1539053", "https://bugs.launchpad.net/bugs/1539067", "https://bugzilla.redhat.com/show_bug.cgi?id=1378762", "https://github.com/ImageMagick/ImageMagick/commit/63346f34f9d19179599b5b256e5e8d3dda46435c", "https://github.com/ImageMagick/ImageMagick/commit/b5ed738f8060266bf4ae521f7e3ed145aa4498a3", "https://github.com/ImageMagick/ImageMagick/commit/c4e63ad30bc42da691f2b5f82a24516dd6b4dc70", "https://github.com/ImageMagick/ImageMagick/issues/105", "https://github.com/ImageMagick/ImageMagick/issues/110"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7530"
imported = 2025-11-25T22:35:59.629Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:01.263Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7530"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7530"
```

# The quantum handling code in ImageMagick allows remote attackers to cause a denial of service (divid...

The quantum handling code in ImageMagick allows remote attackers to cause a denial of service (divide-by-zero error or out-of-bounds write) via a crafted file.

