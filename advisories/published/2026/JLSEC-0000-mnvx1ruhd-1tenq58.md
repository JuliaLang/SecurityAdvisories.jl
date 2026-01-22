```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvx1ruhd-1tenq58"
modified = 2026-01-22T03:39:13.297Z
upstream = ["CVE-2025-56226"]
references = ["https://gist.github.com/Sisyphus-wang/f9e6e017b7d478bebee6e8187672abc8", "https://github.com/libsndfile/libsndfile/issues/1089"]

[[affected]]
pkg = "libsndfile_jll"
ranges = [">= 1.1.0+0"]

[[jlsec_sources]]
id = "CVE-2025-56226"
imported = 2026-01-22T03:39:13.297Z
modified = 2026-01-21T21:21:07.933Z
published = 2026-01-14T15:15:56.873Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-56226"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-56226"
```

# Libsndfile <=1.2.2 contains a memory leak vulnerability in the mpeg_l3_encoder_init() function withi...

Libsndfile <=1.2.2 contains a memory leak vulnerability in the mpeg_l3_encoder_init() function within the mpeg_l3_encode.c file.

