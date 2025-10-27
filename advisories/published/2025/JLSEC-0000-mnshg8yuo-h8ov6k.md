```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnshg8yuo-h8ov6k"
modified = 2025-10-27T15:41:00.912Z
upstream = ["CVE-2021-3996"]
references = ["http://packetstormsecurity.com/files/170176/snap-confine-must_mkdir_and_open_with_perms-Race-Condition.html", "http://seclists.org/fulldisclosure/2022/Dec/4", "http://www.openwall.com/lists/oss-security/2022/11/30/2", "https://access.redhat.com/security/cve/CVE-2021-3996", "https://bugzilla.redhat.com/show_bug.cgi?id=2024628", "https://github.com/util-linux/util-linux/commit/166e87368ae88bf31112a30e078cceae637f4cdb", "https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.37/v2.37.3-ReleaseNotes", "https://security.gentoo.org/glsa/202401-08", "https://security.netapp.com/advisory/ntap-20221209-0002/", "https://www.openwall.com/lists/oss-security/2022/01/24/2", "http://packetstormsecurity.com/files/170176/snap-confine-must_mkdir_and_open_with_perms-Race-Condition.html", "http://seclists.org/fulldisclosure/2022/Dec/4", "http://www.openwall.com/lists/oss-security/2022/11/30/2", "https://access.redhat.com/security/cve/CVE-2021-3996", "https://bugzilla.redhat.com/show_bug.cgi?id=2024628", "https://github.com/util-linux/util-linux/commit/166e87368ae88bf31112a30e078cceae637f4cdb", "https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.37/v2.37.3-ReleaseNotes", "https://security.gentoo.org/glsa/202401-08", "https://security.netapp.com/advisory/ntap-20221209-0002/", "https://www.openwall.com/lists/oss-security/2022/01/24/2"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]
[[affected]]
pkg = "Libuuid_jll"
ranges = ["< 2.39.3+0"]
[[affected]]
pkg = "Libmount_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2021-3996"
imported = 2025-10-27T15:41:00.912Z
modified = 2024-11-21T06:23:20.377Z
published = 2022-08-23T20:15:08.560Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-3996"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-3996"
```

# A logic error was found in the libmount library of util-linux in the function that allows an unprivi...

A logic error was found in the libmount library of util-linux in the function that allows an unprivileged user to unmount a FUSE filesystem. This flaw allows a local user on a vulnerable system to unmount other users' filesystems that are either world-writable themselves (like /tmp) or mounted in a world-writable directory. An attacker may use this flaw to cause a denial of service to applications that use the affected filesystems.

