```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucye-m5qln"
modified = 2025-11-25T22:36:00.662Z
upstream = ["CVE-2023-39978"]
references = ["https://github.com/ImageMagick/ImageMagick6/commit/c90e79b3b22fec309cab55af2ee606f71b027b12", "https://github.com/ImageMagick/ImageMagick6/compare/6.9.12-90...6.9.12-91", "https://github.com/rmagick/rmagick/pull/1406/files", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4UFQJCYJ23HWHNDOVKBHZQ7HCXXL6MM3/", "https://github.com/ImageMagick/ImageMagick6/commit/c90e79b3b22fec309cab55af2ee606f71b027b12", "https://github.com/ImageMagick/ImageMagick6/compare/6.9.12-90...6.9.12-91", "https://github.com/rmagick/rmagick/pull/1406/files", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4UFQJCYJ23HWHNDOVKBHZQ7HCXXL6MM3/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.13025+0"]

[[jlsec_sources]]
id = "CVE-2023-39978"
imported = 2025-11-25T22:36:00.662Z
modified = 2024-11-21T08:16:10.030Z
published = 2023-08-08T06:15:47.790Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-39978"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-39978"
```

# ImageMagick before 6.9.12-91 allows attackers to cause a denial of service (memory consumption) in M...

ImageMagick before 6.9.12-91 allows attackers to cause a denial of service (memory consumption) in Magick::Draw.

