```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubus-1ket9xp"
modified = 2025-11-25T22:35:59.236Z
upstream = ["CVE-2015-8903"]
references = ["http://trac.imagemagick.org/changeset/17856", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=26933", "http://www.openwall.com/lists/oss-security/2015/02/26/13", "http://www.openwall.com/lists/oss-security/2016/06/06/2", "https://bugzilla.redhat.com/show_bug.cgi?id=1195271", "http://trac.imagemagick.org/changeset/17856", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=26933", "http://www.openwall.com/lists/oss-security/2015/02/26/13", "http://www.openwall.com/lists/oss-security/2016/06/06/2", "https://bugzilla.redhat.com/show_bug.cgi?id=1195271"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2015-8903"
imported = 2025-11-25T22:35:59.236Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-02-27T22:59:00.307Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-8903"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-8903"
```

# The ReadVICARImage function in coders/vicar.c in ImageMagick 6.x before 6.9.0-5 Beta allows remote a...

The ReadVICARImage function in coders/vicar.c in ImageMagick 6.x before 6.9.0-5 Beta allows remote attackers to cause a denial of service (infinite loop) via a crafted VICAR file.

