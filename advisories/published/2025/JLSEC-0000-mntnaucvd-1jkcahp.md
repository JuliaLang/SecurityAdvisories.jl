```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucvd-1jkcahp"
modified = 2025-11-25T22:36:00.553Z
upstream = ["CVE-2019-14981"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2019-11/msg00040.html", "http://lists.opensuse.org/opensuse-security-announce/2019-11/msg00042.html", "https://github.com/ImageMagick/ImageMagick/commit/a77d8d97f5a7bced0468f0b08798c83fb67427bc", "https://github.com/ImageMagick/ImageMagick/issues/1552", "https://github.com/ImageMagick/ImageMagick6/commit/b522d2d857d2f75b659936b59b0da9df1682c256", "https://lists.debian.org/debian-lts-announce/2019/10/msg00028.html", "https://lists.debian.org/debian-lts-announce/2020/08/msg00030.html", "https://usn.ubuntu.com/4192-1/", "https://www.debian.org/security/2020/dsa-4712", "http://lists.opensuse.org/opensuse-security-announce/2019-11/msg00040.html", "http://lists.opensuse.org/opensuse-security-announce/2019-11/msg00042.html", "https://github.com/ImageMagick/ImageMagick/commit/a77d8d97f5a7bced0468f0b08798c83fb67427bc", "https://github.com/ImageMagick/ImageMagick/issues/1552", "https://github.com/ImageMagick/ImageMagick6/commit/b522d2d857d2f75b659936b59b0da9df1682c256", "https://lists.debian.org/debian-lts-announce/2019/10/msg00028.html", "https://lists.debian.org/debian-lts-announce/2020/08/msg00030.html", "https://usn.ubuntu.com/4192-1/", "https://www.debian.org/security/2020/dsa-4712"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2019-14981"
imported = 2025-11-25T22:36:00.553Z
modified = 2024-11-21T04:27:49.150Z
published = 2019-08-12T23:15:11.600Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-14981"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-14981"
```

# In ImageMagick 7.x before 7.0.8-41 and 6.x before 6.9.10-41, there is a divide-by-zero vulnerability...

In ImageMagick 7.x before 7.0.8-41 and 6.x before 6.9.10-41, there is a divide-by-zero vulnerability in the MeanShiftImage function. It allows an attacker to cause a denial of service by sending a crafted file.

