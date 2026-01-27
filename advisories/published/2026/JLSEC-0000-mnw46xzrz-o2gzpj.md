```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw46xzrz-o2gzpj"
modified = 2026-01-27T03:38:21.407Z
upstream = ["CVE-2021-3610"]
references = ["http://www.openwall.com/lists/oss-security/2023/05/29/4", "http://www.openwall.com/lists/oss-security/2023/06/05/1", "https://bugzilla.redhat.com/show_bug.cgi?id=1973689", "https://github.com/ImageMagick/ImageMagick/commit/930ff0d1a9bc42925a7856e9ea53f5fc9f318bf3", "http://www.openwall.com/lists/oss-security/2023/05/29/4", "http://www.openwall.com/lists/oss-security/2023/06/05/1", "https://bugzilla.redhat.com/show_bug.cgi?id=1973689", "https://github.com/ImageMagick/ImageMagick/commit/930ff0d1a9bc42925a7856e9ea53f5fc9f318bf3", "https://github.com/fuzzing2026/CVE-PoCs/tree/main/imagemagick-CVE-2021-3610"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = [">= 6.9.12+0, < 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2021-3610"
imported = 2026-01-27T03:38:21.388Z
modified = 2026-01-26T17:16:08.380Z
published = 2022-02-24T19:15:09.213Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-3610"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-3610"
```

# A heap-based buffer overflow vulnerability was found in ImageMagick in versions prior to 7.0.11-14 i...

A heap-based buffer overflow vulnerability was found in ImageMagick in versions prior to 7.0.11-14 in ReadTIFFImage() in coders/tiff.c. This issue is due to an incorrect setting of the pixel array size, which can lead to a crash and segmentation fault.

