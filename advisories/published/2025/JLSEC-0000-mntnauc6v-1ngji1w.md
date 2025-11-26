```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc6v-1ngji1w"
modified = 2025-11-25T22:35:59.671Z
upstream = ["CVE-2017-11449"]
references = ["http://www.securityfocus.com/bid/99958", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867896", "https://github.com/ImageMagick/ImageMagick/commit/529ff26b68febb2ac03062c58452ea0b4c6edbc1", "https://github.com/ImageMagick/ImageMagick/commit/b007dd3a048097d8f58949297f5b434612e1e1a3", "https://github.com/ImageMagick/ImageMagick/issues/556", "http://www.securityfocus.com/bid/99958", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867896", "https://github.com/ImageMagick/ImageMagick/commit/529ff26b68febb2ac03062c58452ea0b4c6edbc1", "https://github.com/ImageMagick/ImageMagick/commit/b007dd3a048097d8f58949297f5b434612e1e1a3", "https://github.com/ImageMagick/ImageMagick/issues/556"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-11449"
imported = 2025-11-25T22:35:59.671Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-19T07:29:00.550Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11449"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11449"
```

# coders/mpc.c in ImageMagick before 7.0.6-1 does not enable seekable streams and thus cannot validate...

coders/mpc.c in ImageMagick before 7.0.6-1 does not enable seekable streams and thus cannot validate blob sizes, which allows remote attackers to cause a denial of service (application crash) or possibly have unspecified other impact via an image received from stdin.

