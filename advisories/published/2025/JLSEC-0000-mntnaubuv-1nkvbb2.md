```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubuv-1nkvbb2"
modified = 2025-11-25T22:35:59.239Z
upstream = ["CVE-2016-10060"]
references = ["http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95208", "https://bugzilla.redhat.com/show_bug.cgi?id=1410470", "https://github.com/ImageMagick/ImageMagick/commit/933e96f01a8c889c7bf5ffd30020e86a02a046e7", "https://github.com/ImageMagick/ImageMagick/issues/196", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95208", "https://bugzilla.redhat.com/show_bug.cgi?id=1410470", "https://github.com/ImageMagick/ImageMagick/commit/933e96f01a8c889c7bf5ffd30020e86a02a046e7", "https://github.com/ImageMagick/ImageMagick/issues/196"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10060"
imported = 2025-11-25T22:35:59.239Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-02T21:59:00.193Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10060"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10060"
```

# The ConcatenateImages function in MagickWand/magick-cli.c in ImageMagick before 7.0.1-10 does not ch...

The ConcatenateImages function in MagickWand/magick-cli.c in ImageMagick before 7.0.1-10 does not check the return value of the fputc function, which allows remote attackers to cause a denial of service (application crash) via a crafted file.

