```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4s-178k772"
modified = 2025-11-25T22:35:59.596Z
upstream = ["CVE-2014-9820"]
references = ["http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=0a89a1ccca6e7ee059b73f5cc924513383e8a330", "https://bugzilla.redhat.com/show_bug.cgi?id=1343476", "http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=0a89a1ccca6e7ee059b73f5cc924513383e8a330", "https://bugzilla.redhat.com/show_bug.cgi?id=1343476"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9820"
imported = 2025-11-25T22:35:59.596Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-30T15:59:00.797Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9820"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9820"
```

# Heap-based buffer overflow in ImageMagick allows remote attackers to have unspecified impact via a c...

Heap-based buffer overflow in ImageMagick allows remote attackers to have unspecified impact via a crafted pnm file.

