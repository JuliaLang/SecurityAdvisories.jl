```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubsk-jhbxaj"
modified = 2025-11-25T22:35:59.156Z
upstream = ["CVE-2013-4298"]
references = ["http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=721273", "http://secunia.com/advisories/54581", "http://secunia.com/advisories/54671", "http://www.debian.org/security/2013/dsa-2750", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=23921", "http://www.imagemagick.org/script/changelog.php", "http://www.ubuntu.com/usn/USN-1949-1", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1218248", "http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=721273", "http://secunia.com/advisories/54581", "http://secunia.com/advisories/54671", "http://www.debian.org/security/2013/dsa-2750", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=23921", "http://www.imagemagick.org/script/changelog.php", "http://www.ubuntu.com/usn/USN-1949-1", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1218248"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2013-4298"
imported = 2025-11-25T22:35:59.156Z
modified = 2025-04-11T00:51:21.963Z
published = 2013-09-10T19:55:11.367Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2013-4298"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2013-4298"
```

# The ReadGIFImage function in coders/gif.c in ImageMagick before 6.7.8-8 allows remote attackers to c...

The ReadGIFImage function in coders/gif.c in ImageMagick before 6.7.8-8 allows remote attackers to cause a denial of service (memory corruption and application crash) via a crafted comment in a GIF image.

