```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnymvf74k-1jyjryc"
modified = 2026-03-31T14:42:50.708Z
upstream = ["CVE-2019-13638"]
references = ["http://packetstormsecurity.com/files/154124/GNU-patch-Command-Injection-Directory-Traversal.html", "https://access.redhat.com/errata/RHSA-2019:2798", "https://access.redhat.com/errata/RHSA-2019:2964", "https://access.redhat.com/errata/RHSA-2019:3757", "https://access.redhat.com/errata/RHSA-2019:3758", "https://access.redhat.com/errata/RHSA-2019:4061", "https://git.savannah.gnu.org/cgit/patch.git/commit/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0", "https://github.com/irsl/gnu-patch-vulnerabilities", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/SVWWGISFWACROJJPVJJL4UBLVZ7LPOLT/", "https://seclists.org/bugtraq/2019/Aug/29", "https://seclists.org/bugtraq/2019/Jul/54", "https://security-tracker.debian.org/tracker/CVE-2019-13638", "https://security.gentoo.org/glsa/201908-22", "https://security.netapp.com/advisory/ntap-20190828-0001/", "https://www.debian.org/security/2019/dsa-4489", "http://packetstormsecurity.com/files/154124/GNU-patch-Command-Injection-Directory-Traversal.html", "https://access.redhat.com/errata/RHSA-2019:2798", "https://access.redhat.com/errata/RHSA-2019:2964", "https://access.redhat.com/errata/RHSA-2019:3757", "https://access.redhat.com/errata/RHSA-2019:3758", "https://access.redhat.com/errata/RHSA-2019:4061", "https://git.savannah.gnu.org/cgit/patch.git/commit/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0", "https://github.com/irsl/gnu-patch-vulnerabilities", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/SVWWGISFWACROJJPVJJL4UBLVZ7LPOLT/", "https://seclists.org/bugtraq/2019/Aug/29", "https://seclists.org/bugtraq/2019/Jul/54", "https://security-tracker.debian.org/tracker/CVE-2019-13638", "https://security.gentoo.org/glsa/201908-22", "https://security.netapp.com/advisory/ntap-20190828-0001/", "https://www.debian.org/security/2019/dsa-4489"]

[[affected]]
pkg = "patch_jll"
ranges = ["< 2.8.0+0"]

[[jlsec_sources]]
id = "CVE-2019-13638"
imported = 2026-03-31T14:42:50.708Z
modified = 2024-11-21T04:25:25.007Z
published = 2019-07-26T13:15:12.783Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-13638"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-13638"
```

GNU patch through 2.7.6 is vulnerable to OS shell command injection that can be exploited by opening a crafted patch file that contains an ed style diff payload with shell metacharacters. The ed editor does not need to be present on the vulnerable system. This is different from CVE-2018-1000156.

