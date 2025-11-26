```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubss-1i820jj"
modified = 2025-11-25T22:35:59.164Z
upstream = ["CVE-2016-3717"]
references = ["http://git.imagemagick.org/repos/ImageMagick/blob/a01518e08c840577cabd7d3ff291a9ba735f7276/ChangeLog", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00024.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00025.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00028.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00032.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00051.html", "http://rhn.redhat.com/errata/RHSA-2016-0726.html", "http://www.debian.org/security/2016/dsa-3580", "http://www.openwall.com/lists/oss-security/2016/05/03/18", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/archive/1/538378/100/0/threaded", "http://www.slackware.com/security/viewer.php?l=slackware-security&y=2016&m=slackware-security.440568", "http://www.ubuntu.com/usn/USN-2990-1", "https://lists.debian.org/debian-lts-announce/2018/06/msg00009.html", "https://security.gentoo.org/glsa/201611-21", "https://www.exploit-db.com/exploits/39767/", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=29588", "https://www.imagemagick.org/script/changelog.php", "http://git.imagemagick.org/repos/ImageMagick/blob/a01518e08c840577cabd7d3ff291a9ba735f7276/ChangeLog", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00024.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00025.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00028.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00032.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00051.html", "http://rhn.redhat.com/errata/RHSA-2016-0726.html", "http://www.debian.org/security/2016/dsa-3580", "http://www.openwall.com/lists/oss-security/2016/05/03/18", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/archive/1/538378/100/0/threaded", "http://www.slackware.com/security/viewer.php?l=slackware-security&y=2016&m=slackware-security.440568", "http://www.ubuntu.com/usn/USN-2990-1", "https://lists.debian.org/debian-lts-announce/2018/06/msg00009.html", "https://security.gentoo.org/glsa/201611-21", "https://www.exploit-db.com/exploits/39767/", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=29588", "https://www.imagemagick.org/script/changelog.php"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-3717"
imported = 2025-11-25T22:35:59.164Z
modified = 2025-04-12T10:46:40.837Z
published = 2016-05-05T18:59:07.663Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-3717"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-3717"
```

# The LABEL coder in ImageMagick before 6.9.3-10 and 7.x before 7.0.1-1 allows remote attackers to rea...

The LABEL coder in ImageMagick before 6.9.3-10 and 7.x before 7.0.1-1 allows remote attackers to read arbitrary files via a crafted image.

