```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubyo-1jh00bl"
modified = 2025-11-25T22:35:59.376Z
upstream = ["CVE-2016-10049"]
references = ["http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95180", "https://bugzilla.redhat.com/show_bug.cgi?id=1410452", "https://github.com/ImageMagick/ImageMagick/commit/13db820f5e24cd993ee554e99377fea02a904e18", "https://github.com/ImageMagick/ImageMagick/commit/3e9165285eda6e1bb71172031d3048b51bb443a4", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=29710", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95180", "https://bugzilla.redhat.com/show_bug.cgi?id=1410452", "https://github.com/ImageMagick/ImageMagick/commit/13db820f5e24cd993ee554e99377fea02a904e18", "https://github.com/ImageMagick/ImageMagick/commit/3e9165285eda6e1bb71172031d3048b51bb443a4", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=29710"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10049"
imported = 2025-11-25T22:35:59.376Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-23T17:59:00.390Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10049"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10049"
```

# Buffer overflow in the ReadRLEImage function in coders/rle.c in ImageMagick before 6.9.4-4 allows re...

Buffer overflow in the ReadRLEImage function in coders/rle.c in ImageMagick before 6.9.4-4 allows remote attackers to cause a denial of service (application crash) or have other unspecified impact via a crafted RLE file.

