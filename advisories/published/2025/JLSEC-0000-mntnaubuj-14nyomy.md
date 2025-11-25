```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubuj-14nyomy"
modified = 2025-11-25T22:35:59.227Z
upstream = ["CVE-2016-9298"]
references = ["http://www.openwall.com/lists/oss-security/2016/11/13/1", "http://www.openwall.com/lists/oss-security/2016/11/14/10", "http://www.securityfocus.com/bid/94310", "https://github.com/ImageMagick/ImageMagick/commit/3cbfb163cff9e5b8cdeace8312e9bfee810ed02b", "https://github.com/ImageMagick/ImageMagick/issues/296", "https://security.gentoo.org/glsa/201702-09", "http://www.openwall.com/lists/oss-security/2016/11/13/1", "http://www.openwall.com/lists/oss-security/2016/11/14/10", "http://www.securityfocus.com/bid/94310", "https://github.com/ImageMagick/ImageMagick/commit/3cbfb163cff9e5b8cdeace8312e9bfee810ed02b", "https://github.com/ImageMagick/ImageMagick/issues/296", "https://security.gentoo.org/glsa/201702-09"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-9298"
imported = 2025-11-25T22:35:59.227Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-01-27T22:59:01.897Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-9298"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-9298"
```

# Heap overflow in the WaveletDenoiseImage function in MagickCore/fx.c in ImageMagick before 6.9.6-4 a...

Heap overflow in the WaveletDenoiseImage function in MagickCore/fx.c in ImageMagick before 6.9.6-4 and 7.x before 7.0.3-6 allows remote attackers to cause a denial of service (crash) via a crafted image.

