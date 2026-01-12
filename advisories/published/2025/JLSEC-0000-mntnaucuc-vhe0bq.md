```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucuc-vhe0bq"
modified = 2025-11-25T22:36:00.516Z
upstream = ["CVE-2019-7398"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00034.html", "http://lists.opensuse.org/opensuse-security-announce/2019-05/msg00006.html", "http://www.securityfocus.com/bid/106848", "https://github.com/ImageMagick/ImageMagick/issues/1453", "https://usn.ubuntu.com/4034-1/", "https://www.debian.org/security/2020/dsa-4712", "http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00034.html", "http://lists.opensuse.org/opensuse-security-announce/2019-05/msg00006.html", "http://www.securityfocus.com/bid/106848", "https://github.com/ImageMagick/ImageMagick/issues/1453", "https://usn.ubuntu.com/4034-1/", "https://www.debian.org/security/2020/dsa-4712"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2019-7398"
imported = 2025-11-25T22:36:00.516Z
modified = 2024-11-21T04:48:09.020Z
published = 2019-02-05T00:29:00.570Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-7398"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-7398"
```

# In ImageMagick before 7.0.8-25, a memory leak exists in WriteDIBImage in coders/dib.c.

In ImageMagick before 7.0.8-25, a memory leak exists in WriteDIBImage in coders/dib.c.

