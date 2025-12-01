```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsaq079h-1lwmywk"
modified = 2025-10-22T22:39:44.837Z
upstream = ["CVE-2016-9840"]
references = ["http://lists.opensuse.org/opensuse-updates/2016-12/msg00127.html", "http://lists.opensuse.org/opensuse-updates/2017-01/msg00050.html", "http://lists.opensuse.org/opensuse-updates/2017-01/msg00053.html", "http://www.openwall.com/lists/oss-security/2016/12/05/21", "http://www.oracle.com/technetwork/security-advisory/cpuoct2017-3236626.html", "http://www.oracle.com/technetwork/security-advisory/cpuoct2018-4428296.html", "http://www.securityfocus.com/bid/95131", "http://www.securitytracker.com/id/1039427", "https://access.redhat.com/errata/RHSA-2017:1220", "https://access.redhat.com/errata/RHSA-2017:1221", "https://access.redhat.com/errata/RHSA-2017:1222", "https://access.redhat.com/errata/RHSA-2017:2999", "https://access.redhat.com/errata/RHSA-2017:3046", "https://access.redhat.com/errata/RHSA-2017:3047", "https://access.redhat.com/errata/RHSA-2017:3453", "https://bugzilla.redhat.com/show_bug.cgi?id=1402345", "https://github.com/madler/zlib/commit/6a043145ca6e9c55184013841a67b2fef87e44c0", "https://lists.debian.org/debian-lts-announce/2019/03/msg00027.html", "https://lists.debian.org/debian-lts-announce/2020/01/msg00030.html", "https://security.gentoo.org/glsa/201701-56", "https://security.gentoo.org/glsa/202007-54", "https://support.apple.com/HT208112", "https://support.apple.com/HT208113", "https://support.apple.com/HT208115", "https://support.apple.com/HT208144", "https://usn.ubuntu.com/4246-1/", "https://usn.ubuntu.com/4292-1/", "https://wiki.mozilla.org/MOSS/Secure_Open_Source/Completed#zlib", "https://wiki.mozilla.org/images/0/09/Zlib-report.pdf", "https://www.oracle.com/security-alerts/cpujul2020.html", "http://lists.opensuse.org/opensuse-updates/2016-12/msg00127.html", "http://lists.opensuse.org/opensuse-updates/2017-01/msg00050.html", "http://lists.opensuse.org/opensuse-updates/2017-01/msg00053.html", "http://www.openwall.com/lists/oss-security/2016/12/05/21", "http://www.oracle.com/technetwork/security-advisory/cpuoct2017-3236626.html", "http://www.oracle.com/technetwork/security-advisory/cpuoct2018-4428296.html", "http://www.securityfocus.com/bid/95131", "http://www.securitytracker.com/id/1039427", "https://access.redhat.com/errata/RHSA-2017:1220", "https://access.redhat.com/errata/RHSA-2017:1221", "https://access.redhat.com/errata/RHSA-2017:1222", "https://access.redhat.com/errata/RHSA-2017:2999", "https://access.redhat.com/errata/RHSA-2017:3046", "https://access.redhat.com/errata/RHSA-2017:3047", "https://access.redhat.com/errata/RHSA-2017:3453", "https://bugzilla.redhat.com/show_bug.cgi?id=1402345", "https://github.com/madler/zlib/commit/6a043145ca6e9c55184013841a67b2fef87e44c0", "https://lists.debian.org/debian-lts-announce/2019/03/msg00027.html", "https://lists.debian.org/debian-lts-announce/2020/01/msg00030.html", "https://security.gentoo.org/glsa/201701-56", "https://security.gentoo.org/glsa/202007-54", "https://support.apple.com/HT208112", "https://support.apple.com/HT208113", "https://support.apple.com/HT208115", "https://support.apple.com/HT208144", "https://usn.ubuntu.com/4246-1/", "https://usn.ubuntu.com/4292-1/", "https://wiki.mozilla.org/MOSS/Secure_Open_Source/Completed#zlib", "https://wiki.mozilla.org/images/0/09/Zlib-report.pdf", "https://www.oracle.com/security-alerts/cpujul2020.html"]

[[affected]]
pkg = "boost_jll"
ranges = ["< 1.79.0+0"]

[[jlsec_sources]]
id = "CVE-2016-9840"
imported = 2025-10-22T22:39:44.837Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-05-23T04:29:01.667Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-9840"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-9840"
```

# inftrees.c in zlib 1.2.8 might allow context-dependent attackers to have unspecified impact by lever...

inftrees.c in zlib 1.2.8 might allow context-dependent attackers to have unspecified impact by leveraging improper pointer arithmetic.

