```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss7alf3-1z0y8mv"
modified = 2025-11-04T04:15:48.207Z
upstream = ["CVE-2025-48175"]
references = ["https://github.com/AOMediaCodec/libavif/commit/64d956ed5a602f78cebf29da023280944ee92efd", "https://github.com/AOMediaCodec/libavif/pull/2769", "https://github.com/AOMediaCodec/libavif/security/advisories/GHSA-762c-2538-h844", "https://lists.debian.org/debian-lts-announce/2025/05/msg00031.html"]

[[affected]]
pkg = "libavif_jll"
ranges = ["< 1.3.0+0"]

[[jlsec_sources]]
id = "CVE-2025-48175"
imported = 2025-11-04T04:15:48.207Z
modified = 2025-11-03T20:19:06.153Z
published = 2025-05-16T05:15:37.470Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-48175"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-48175"
```

# In libavif before 1.3.0, avifImageRGBToYUV in reformat.c has integer overflows in multiplications in...

In libavif before 1.3.0, avifImageRGBToYUV in reformat.c has integer overflows in multiplications involving rgbRowBytes, yRowBytes, uRowBytes, and vRowBytes.

