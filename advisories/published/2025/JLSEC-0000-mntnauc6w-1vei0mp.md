```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc6w-1vei0mp"
modified = 2025-11-25T22:35:59.672Z
upstream = ["CVE-2017-11450"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867894", "https://github.com/ImageMagick/ImageMagick/commit/948356eec65aea91995d4b7cc487d197d2c5f602", "https://github.com/ImageMagick/ImageMagick/issues/556", "https://security-tracker.debian.org/tracker/CVE-2017-11450", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867894", "https://github.com/ImageMagick/ImageMagick/commit/948356eec65aea91995d4b7cc487d197d2c5f602", "https://github.com/ImageMagick/ImageMagick/issues/556", "https://security-tracker.debian.org/tracker/CVE-2017-11450"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-11450"
imported = 2025-11-25T22:35:59.672Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-19T07:29:00.580Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11450"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11450"
```

# coders/jpeg.c in ImageMagick before 7.0.6-1 allows remote attackers to cause a denial of service (ap...

coders/jpeg.c in ImageMagick before 7.0.6-1 allows remote attackers to cause a denial of service (application crash) or possibly have unspecified other impact via JPEG data that is too short.

