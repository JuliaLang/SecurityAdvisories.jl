```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubv0-2zf7mg"
modified = 2025-11-25T22:35:59.244Z
upstream = ["CVE-2016-10071"]
references = ["http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95222", "https://bugzilla.redhat.com/show_bug.cgi?id=1410513", "https://github.com/ImageMagick/ImageMagick/commit/1bc1fd0ff8c555841c78829217ac81fa0598255d", "https://github.com/ImageMagick/ImageMagick/commit/f3b483e8b054c50149912523b4773687e18afe25", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95222", "https://bugzilla.redhat.com/show_bug.cgi?id=1410513", "https://github.com/ImageMagick/ImageMagick/commit/1bc1fd0ff8c555841c78829217ac81fa0598255d", "https://github.com/ImageMagick/ImageMagick/commit/f3b483e8b054c50149912523b4773687e18afe25"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10071"
imported = 2025-11-25T22:35:59.244Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-02T21:59:00.600Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10071"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10071"
```

# coders/mat.c in ImageMagick before 6.9.4-0 allows remote attackers to cause a denial of service (out...

coders/mat.c in ImageMagick before 6.9.4-0 allows remote attackers to cause a denial of service (out-of-bounds read and application crash) via a crafted mat file.

