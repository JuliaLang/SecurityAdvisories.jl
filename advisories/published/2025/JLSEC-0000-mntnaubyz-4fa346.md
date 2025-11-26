```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubyz-4fa346"
modified = 2025-11-25T22:35:59.387Z
upstream = ["CVE-2017-5506"]
references = ["http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95753", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851383", "https://github.com/ImageMagick/ImageMagick/commit/9a069e0f2e027ec5138f998023cf9cb62c04889f", "https://github.com/ImageMagick/ImageMagick/issues/354", "https://security.gentoo.org/glsa/201702-09", "http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95753", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851383", "https://github.com/ImageMagick/ImageMagick/commit/9a069e0f2e027ec5138f998023cf9cb62c04889f", "https://github.com/ImageMagick/ImageMagick/issues/354", "https://security.gentoo.org/glsa/201702-09"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2017-5506"
imported = 2025-11-25T22:35:59.387Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-24T15:59:00.967Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-5506"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-5506"
```

# Double free vulnerability in magick/profile.c in ImageMagick allows remote attackers to have unspeci...

Double free vulnerability in magick/profile.c in ImageMagick allows remote attackers to have unspecified impact via a crafted file.

