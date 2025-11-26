```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubt2-px2em5"
modified = 2025-11-25T22:35:59.174Z
upstream = ["CVE-2016-5118"]
references = ["http://git.imagemagick.org/repos/ImageMagick/commit/40639d173aa8c76b850d625c630b711fee4dcfb8", "http://hg.code.sf.net/p/graphicsmagick/code/file/41876934e762/ChangeLog", "http://hg.code.sf.net/p/graphicsmagick/code/rev/ae3928faa858", "http://lists.opensuse.org/opensuse-security-announce/2016-06/msg00008.html", "http://lists.opensuse.org/opensuse-security-announce/2016-06/msg00009.html", "http://lists.opensuse.org/opensuse-security-announce/2016-06/msg00011.html", "http://lists.opensuse.org/opensuse-security-announce/2016-06/msg00021.html", "http://lists.opensuse.org/opensuse-security-announce/2016-06/msg00030.html", "http://lists.opensuse.org/opensuse-security-announce/2016-06/msg00032.html", "http://lists.opensuse.org/opensuse-security-announce/2016-06/msg00047.html", "http://www.debian.org/security/2016/dsa-3591", "http://www.debian.org/security/2016/dsa-3746", "http://www.openwall.com/lists/oss-security/2016/05/29/7", "http://www.openwall.com/lists/oss-security/2016/05/30/1", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/bid/90938", "http://www.securitytracker.com/id/1035984", "http://www.securitytracker.com/id/1035985", "http://www.slackware.com/security/viewer.php?l=slackware-security&y=2016&m=slackware-security.397749", "http://www.ubuntu.com/usn/USN-2990-1", "https://access.redhat.com/errata/RHSA-2016:1237", "http://git.imagemagick.org/repos/ImageMagick/commit/40639d173aa8c76b850d625c630b711fee4dcfb8", "http://hg.code.sf.net/p/graphicsmagick/code/file/41876934e762/ChangeLog", "http://hg.code.sf.net/p/graphicsmagick/code/rev/ae3928faa858", "http://lists.opensuse.org/opensuse-security-announce/2016-06/msg00008.html", "http://lists.opensuse.org/opensuse-security-announce/2016-06/msg00009.html", "http://lists.opensuse.org/opensuse-security-announce/2016-06/msg00011.html", "http://lists.opensuse.org/opensuse-security-announce/2016-06/msg00021.html", "http://lists.opensuse.org/opensuse-security-announce/2016-06/msg00030.html", "http://lists.opensuse.org/opensuse-security-announce/2016-06/msg00032.html", "http://lists.opensuse.org/opensuse-security-announce/2016-06/msg00047.html", "http://www.debian.org/security/2016/dsa-3591", "http://www.debian.org/security/2016/dsa-3746", "http://www.openwall.com/lists/oss-security/2016/05/29/7", "http://www.openwall.com/lists/oss-security/2016/05/30/1", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/bid/90938", "http://www.securitytracker.com/id/1035984", "http://www.securitytracker.com/id/1035985", "http://www.slackware.com/security/viewer.php?l=slackware-security&y=2016&m=slackware-security.397749", "http://www.ubuntu.com/usn/USN-2990-1", "https://access.redhat.com/errata/RHSA-2016:1237"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2016-5118"
imported = 2025-11-25T22:35:59.174Z
modified = 2025-04-12T10:46:40.837Z
published = 2016-06-10T15:59:06.737Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-5118"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-5118"
```

# The OpenBlob function in blob.c in GraphicsMagick before 1.3.24 and ImageMagick allows remote attack...

The OpenBlob function in blob.c in GraphicsMagick before 1.3.24 and ImageMagick allows remote attackers to execute arbitrary code via a | (pipe) character at the start of a filename.

