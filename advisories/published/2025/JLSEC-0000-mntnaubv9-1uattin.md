```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubv9-1uattin"
modified = 2025-11-25T22:35:59.253Z
upstream = ["CVE-2016-10252"]
references = ["http://git.imagemagick.org/repos/ImageMagick/commit/6790815c75bdea0357df5564345847856e995d6b", "http://www.debian.org/security/2017/dsa-3808", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=857426", "https://github.com/Opendigitalradio/ODR-PadEnc/issues/2", "http://git.imagemagick.org/repos/ImageMagick/commit/6790815c75bdea0357df5564345847856e995d6b", "http://www.debian.org/security/2017/dsa-3808", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=857426", "https://github.com/Opendigitalradio/ODR-PadEnc/issues/2"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10252"
imported = 2025-11-25T22:35:59.253Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-14T22:59:00.603Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10252"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10252"
```

# Memory leak in the IsOptionMember function in MagickCore/option.c in ImageMagick before 6.9.2-2, as ...

Memory leak in the IsOptionMember function in MagickCore/option.c in ImageMagick before 6.9.2-2, as used in ODR-PadEnc and other products, allows attackers to trigger memory consumption.

