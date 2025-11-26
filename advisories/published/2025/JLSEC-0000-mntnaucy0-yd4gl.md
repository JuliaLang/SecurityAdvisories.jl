```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucy0-yd4gl"
modified = 2025-11-25T22:36:00.648Z
upstream = ["CVE-2022-0284"]
references = ["https://access.redhat.com/security/cve/CVE-2022-0284", "https://bugzilla.redhat.com/show_bug.cgi?id=2045943", "https://github.com/ImageMagick/ImageMagick/commit/e50f19fd73c792ebe912df8ab83aa51a243a3da7", "https://github.com/ImageMagick/ImageMagick/issues/4729", "https://access.redhat.com/security/cve/CVE-2022-0284", "https://bugzilla.redhat.com/show_bug.cgi?id=2045943", "https://github.com/ImageMagick/ImageMagick/commit/e50f19fd73c792ebe912df8ab83aa51a243a3da7", "https://github.com/ImageMagick/ImageMagick/issues/4729"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2022-0284"
imported = 2025-11-25T22:36:00.648Z
modified = 2024-11-21T06:38:18.113Z
published = 2022-08-29T15:15:09.183Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-0284"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-0284"
```

# A heap-based-buffer-over-read flaw was found in ImageMagick's GetPixelAlpha() function of 'pixel-acc...

A heap-based-buffer-over-read flaw was found in ImageMagick's GetPixelAlpha() function of 'pixel-accessor.h'. This vulnerability is triggered when an attacker passes a specially crafted Tagged Image File Format (TIFF) image to convert it into a PICON file format. This issue can potentially lead to a denial of service and information disclosure.

