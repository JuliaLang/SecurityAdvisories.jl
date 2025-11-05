```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl0gh0-4tf9nz"
modified = 2025-11-05T03:27:36.036Z
upstream = ["CVE-2022-0204"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2039807", "https://github.com/bluez/bluez/commit/591c546c536b42bef696d027f64aa22434f8c3f0", "https://github.com/bluez/bluez/security/advisories/GHSA-479m-xcq5-9g2q", "https://lists.debian.org/debian-lts-announce/2022/10/msg00026.html", "https://security.gentoo.org/glsa/202209-16", "https://bugzilla.redhat.com/show_bug.cgi?id=2039807", "https://github.com/bluez/bluez/commit/591c546c536b42bef696d027f64aa22434f8c3f0", "https://github.com/bluez/bluez/security/advisories/GHSA-479m-xcq5-9g2q", "https://lists.debian.org/debian-lts-announce/2022/10/msg00026.html", "https://lists.debian.org/debian-lts-announce/2024/09/msg00022.html", "https://security.gentoo.org/glsa/202209-16"]

[[affected]]
pkg = "BlueZ_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2022-0204"
imported = 2025-11-05T03:27:36.036Z
modified = 2025-11-04T16:15:46.130Z
published = 2022-03-10T17:44:55.230Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-0204"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-0204"
```

# A heap overflow vulnerability was found in bluez in versions prior to 5.63

A heap overflow vulnerability was found in bluez in versions prior to 5.63. An attacker with local network access could pass specially crafted files causing an application to halt or crash, leading to a denial of service.

