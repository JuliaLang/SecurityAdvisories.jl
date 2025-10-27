```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnshg8yua-k7lqh4"
modified = 2025-10-27T15:41:00.898Z
upstream = ["CVE-2021-37600"]
references = ["https://github.com/karelzak/util-linux/commit/1c9143d0c1f979c3daf10e1c37b5b1e916c22a1c", "https://github.com/karelzak/util-linux/issues/1395", "https://lists.debian.org/debian-lts-announce/2024/04/msg00005.html", "https://security.gentoo.org/glsa/202401-08", "https://security.netapp.com/advisory/ntap-20210902-0002/", "https://github.com/karelzak/util-linux/commit/1c9143d0c1f979c3daf10e1c37b5b1e916c22a1c", "https://github.com/karelzak/util-linux/issues/1395", "https://lists.debian.org/debian-lts-announce/2024/04/msg00005.html", "https://security.gentoo.org/glsa/202401-08", "https://security.netapp.com/advisory/ntap-20210902-0002/"]

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
id = "CVE-2021-37600"
imported = 2025-10-27T15:41:00.898Z
modified = 2024-11-21T06:15:30.107Z
published = 2021-07-30T14:15:18.737Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-37600"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-37600"
```

# An integer overflow in util-linux through 2.37.1 can potentially cause a buffer overflow if an attac...

An integer overflow in util-linux through 2.37.1 can potentially cause a buffer overflow if an attacker were able to use system resources in a way that leads to a large number in the /proc/sysvipc/sem file. NOTE: this is unexploitable in GNU C Library environments, and possibly in all realistic environments.

