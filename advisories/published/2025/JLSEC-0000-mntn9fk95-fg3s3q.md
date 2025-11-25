```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntn9fk95-fg3s3q"
modified = 2025-11-25T21:56:30.665Z
upstream = ["CVE-2020-18768"]
references = ["http://bugzilla.maptools.org/show_bug.cgi?id=2848", "http://bugzilla.maptools.org/show_bug.cgi?id=2848"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.1.0+0"]

[[jlsec_sources]]
id = "CVE-2020-18768"
imported = 2025-11-25T21:56:30.665Z
modified = 2024-11-21T05:08:48.077Z
published = 2023-08-22T19:15:55.480Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-18768"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-18768"
```

# There exists one heap buffer overflow in _TIFFmemcpy in tif_unix.c in libtiff 4.0.10, which allows a...

There exists one heap buffer overflow in _TIFFmemcpy in tif_unix.c in libtiff 4.0.10, which allows an attacker to cause a denial-of-service through a crafted tiff file.

