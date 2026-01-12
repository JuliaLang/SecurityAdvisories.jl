```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubu0-l5cm3x"
modified = 2025-11-25T22:35:59.208Z
upstream = ["CVE-2016-6823"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/26/3", "http://www.securityfocus.com/bid/93158", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=834504", "https://github.com/ImageMagick/ImageMagick/commit/4cc6ec8a4197d4c008577127736bf7985d632323", "http://www.openwall.com/lists/oss-security/2016/09/26/3", "http://www.securityfocus.com/bid/93158", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=834504", "https://github.com/ImageMagick/ImageMagick/commit/4cc6ec8a4197d4c008577127736bf7985d632323"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2016-6823"
imported = 2025-11-25T22:35:59.208Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-01-18T17:59:00.467Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-6823"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-6823"
```

# Integer overflow in the BMP coder in ImageMagick before 7.0.2-10 allows remote attackers to cause a ...

Integer overflow in the BMP coder in ImageMagick before 7.0.2-10 allows remote attackers to cause a denial of service (crash) via crafted height and width values, which triggers an out-of-bounds write.

