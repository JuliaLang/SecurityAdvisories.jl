```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauctq-1ep8v0r"
modified = 2025-11-25T22:36:00.494Z
upstream = ["CVE-2018-16323"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/216d117f05bff87b9dc4db55a1b1fadb38bcb786", "https://usn.ubuntu.com/3785-1/", "https://usn.ubuntu.com/4034-1/", "https://www.exploit-db.com/exploits/45890/", "https://github.com/ImageMagick/ImageMagick/commit/216d117f05bff87b9dc4db55a1b1fadb38bcb786", "https://usn.ubuntu.com/3785-1/", "https://usn.ubuntu.com/4034-1/", "https://www.exploit-db.com/exploits/45890/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2018-16323"
imported = 2025-11-25T22:36:00.494Z
modified = 2024-11-21T03:52:31.107Z
published = 2018-09-01T18:29:01.053Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2018-16323"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2018-16323"
```

# ReadXBMImage in coders/xbm.c in ImageMagick before 7.0.8-9 leaves data uninitialized when processing...

ReadXBMImage in coders/xbm.c in ImageMagick before 7.0.8-9 leaves data uninitialized when processing an XBM file that has a negative pixel value. If the affected code is used as a library loaded into a process that includes sensitive information, that information sometimes can be leaked via the image data.

