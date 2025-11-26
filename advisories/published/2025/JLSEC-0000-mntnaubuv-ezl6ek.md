```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubuv-ezl6ek"
modified = 2025-11-25T22:35:59.239Z
upstream = ["CVE-2016-10062"]
references = ["http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95209", "https://bugzilla.redhat.com/show_bug.cgi?id=1410473", "https://github.com/ImageMagick/ImageMagick/issues/196", "http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95209", "https://bugzilla.redhat.com/show_bug.cgi?id=1410473", "https://github.com/ImageMagick/ImageMagick/issues/196"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2016-10062"
imported = 2025-11-25T22:35:59.239Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-02T21:59:00.270Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10062"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10062"
```

# The ReadGROUP4Image function in coders/tiff.c in ImageMagick does not check the return value of the ...

The ReadGROUP4Image function in coders/tiff.c in ImageMagick does not check the return value of the fwrite function, which allows remote attackers to cause a denial of service (application crash) via a crafted file.

