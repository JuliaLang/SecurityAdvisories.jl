```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns9kul6p-10b7309"
modified = 2025-10-22T03:27:38.689Z
upstream = ["CVE-2016-3715"]
references = ["http://git.imagemagick.org/repos/ImageMagick/blob/a01518e08c840577cabd7d3ff291a9ba735f7276/ChangeLog", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00024.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00025.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00028.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00032.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00051.html", "http://rhn.redhat.com/errata/RHSA-2016-0726.html", "http://www.debian.org/security/2016/dsa-3580", "http://www.debian.org/security/2016/dsa-3746", "http://www.openwall.com/lists/oss-security/2016/05/03/18", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/archive/1/538378/100/0/threaded", "http://www.securityfocus.com/bid/89852", "http://www.slackware.com/security/viewer.php?l=slackware-security&y=2016&m=slackware-security.440568", "http://www.ubuntu.com/usn/USN-2990-1", "https://security.gentoo.org/glsa/201611-21", "https://www.exploit-db.com/exploits/39767/", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=29588", "https://www.imagemagick.org/script/changelog.php", "http://git.imagemagick.org/repos/ImageMagick/blob/a01518e08c840577cabd7d3ff291a9ba735f7276/ChangeLog", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00024.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00025.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00028.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00032.html", "http://lists.opensuse.org/opensuse-security-announce/2016-05/msg00051.html", "http://rhn.redhat.com/errata/RHSA-2016-0726.html", "http://www.debian.org/security/2016/dsa-3580", "http://www.debian.org/security/2016/dsa-3746", "http://www.openwall.com/lists/oss-security/2016/05/03/18", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/archive/1/538378/100/0/threaded", "http://www.securityfocus.com/bid/89852", "http://www.slackware.com/security/viewer.php?l=slackware-security&y=2016&m=slackware-security.440568", "http://www.ubuntu.com/usn/USN-2990-1", "https://security.gentoo.org/glsa/201611-21", "https://www.exploit-db.com/exploits/39767/", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=29588", "https://www.imagemagick.org/script/changelog.php", "https://www.cisa.gov/known-exploited-vulnerabilities-catalog?field_cve=CVE-2016-3715"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-3715"
imported = 2025-10-22T03:27:38.689Z
modified = 2025-10-22T00:15:51.870Z
published = 2016-05-05T18:59:04.727Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-3715"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-3715"
```

# The EPHEMERAL coder in ImageMagick before 6.9.3-10 and 7.x before 7.0.1-1 allows remote attackers to...

The EPHEMERAL coder in ImageMagick before 6.9.3-10 and 7.x before 7.0.1-1 allows remote attackers to delete arbitrary files via a crafted image.

