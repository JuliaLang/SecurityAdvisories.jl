```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4q-18k4ntn"
modified = 2025-11-25T22:35:59.594Z
upstream = ["CVE-2014-9817"]
references = ["http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=e24de96ab25b396ae914a7640ff4d61e58c40cf0", "https://bugzilla.redhat.com/show_bug.cgi?id=1343473", "http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=e24de96ab25b396ae914a7640ff4d61e58c40cf0", "https://bugzilla.redhat.com/show_bug.cgi?id=1343473"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9817"
imported = 2025-11-25T22:35:59.594Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-30T15:59:00.687Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9817"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9817"
```

# Heap-based buffer overflow in ImageMagick allows remote attackers to have unspecified impact via a c...

Heap-based buffer overflow in ImageMagick allows remote attackers to have unspecified impact via a crafted pdb file.

