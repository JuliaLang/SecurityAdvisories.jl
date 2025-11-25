```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucy1-1b113c8"
modified = 2025-11-25T22:36:00.649Z
upstream = ["CVE-2022-1115"]
references = ["https://access.redhat.com/security/cve/CVE-2022-1115", "https://bugzilla.redhat.com/show_bug.cgi?id=2067022", "https://github.com/ImageMagick/ImageMagick/commit/c8718305f120293d8bf13724f12eed885d830b09", "https://github.com/ImageMagick/ImageMagick/issues/4974", "https://github.com/ImageMagick/ImageMagick6/commit/1f860f52bd8d58737ad883072203391096b30b51", "https://access.redhat.com/security/cve/CVE-2022-1115", "https://bugzilla.redhat.com/show_bug.cgi?id=2067022", "https://github.com/ImageMagick/ImageMagick/commit/c8718305f120293d8bf13724f12eed885d830b09", "https://github.com/ImageMagick/ImageMagick/issues/4974", "https://github.com/ImageMagick/ImageMagick6/commit/1f860f52bd8d58737ad883072203391096b30b51"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2022-1115"
imported = 2025-11-25T22:36:00.649Z
modified = 2024-11-21T06:40:04.640Z
published = 2022-08-29T15:15:10.297Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-1115"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-1115"
```

# A heap-buffer-overflow flaw was found in ImageMagick’s PushShortPixel() function of quantum-privat...

A heap-buffer-overflow flaw was found in ImageMagick’s PushShortPixel() function of quantum-private.h file. This vulnerability is triggered when an attacker passes a specially crafted TIFF image file to ImageMagick for conversion, potentially leading to a denial of service.

