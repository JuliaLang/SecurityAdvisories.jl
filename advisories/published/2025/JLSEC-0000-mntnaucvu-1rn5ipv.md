```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucvu-1rn5ipv"
modified = 2025-11-25T22:36:00.570Z
upstream = ["CVE-2014-1958"]
references = ["http://lists.opensuse.org/opensuse-updates/2014-03/msg00032.html", "http://lists.opensuse.org/opensuse-updates/2014-03/msg00039.html", "http://trac.imagemagick.org/changeset/14801", "http://ubuntu.com/usn/usn-2132-1", "http://www.openwall.com/lists/oss-security/2014/02/13/2", "http://www.openwall.com/lists/oss-security/2014/02/13/5", "https://www.openwall.com/lists/oss-security/2014/02/19/13", "http://lists.opensuse.org/opensuse-updates/2014-03/msg00032.html", "http://lists.opensuse.org/opensuse-updates/2014-03/msg00039.html", "http://trac.imagemagick.org/changeset/14801", "http://ubuntu.com/usn/usn-2132-1", "http://www.openwall.com/lists/oss-security/2014/02/13/2", "http://www.openwall.com/lists/oss-security/2014/02/13/5", "https://www.openwall.com/lists/oss-security/2014/02/19/13"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-1958"
imported = 2025-11-25T22:36:00.570Z
modified = 2024-11-21T02:05:21.043Z
published = 2020-02-06T15:15:10.483Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-1958"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-1958"
```

# Buffer overflow in the DecodePSDPixels function in coders/psd.c in ImageMagick before 6.8.8-5 might ...

Buffer overflow in the DecodePSDPixels function in coders/psd.c in ImageMagick before 6.8.8-5 might allow remote attackers to execute arbitrary code via a crafted PSD image, involving the L%06ld string, a different vulnerability than CVE-2014-2030.

