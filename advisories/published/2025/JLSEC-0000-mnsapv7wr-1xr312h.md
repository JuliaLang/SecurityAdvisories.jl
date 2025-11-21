```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsapv7wr-1xr312h"
modified = 2025-10-22T22:35:52.395Z
upstream = ["CVE-2020-11080"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2020-06/msg00024.html", "https://github.com/nghttp2/nghttp2/commit/336a98feb0d56b9ac54e12736b18785c27f75090", "https://github.com/nghttp2/nghttp2/commit/f8da73bd042f810f34d19f9eae02b46d870af394", "https://github.com/nghttp2/nghttp2/security/advisories/GHSA-q5wr-xfw9-q7xr", "https://lists.debian.org/debian-lts-announce/2021/10/msg00011.html", "https://lists.debian.org/debian-lts-announce/2023/10/msg00023.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4OOYAMJVLLCLXDTHW3V5UXNULZBBK4O6/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/AAC2AA36OTRHKSVM5OV7TTVB3CZIGEFL/", "https://www.debian.org/security/2020/dsa-4696", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpujan2021.html", "https://www.oracle.com/security-alerts/cpujul2020.html", "https://www.oracle.com/security-alerts/cpuoct2020.html", "http://lists.opensuse.org/opensuse-security-announce/2020-06/msg00024.html", "https://github.com/nghttp2/nghttp2/commit/336a98feb0d56b9ac54e12736b18785c27f75090", "https://github.com/nghttp2/nghttp2/commit/f8da73bd042f810f34d19f9eae02b46d870af394", "https://github.com/nghttp2/nghttp2/security/advisories/GHSA-q5wr-xfw9-q7xr", "https://lists.debian.org/debian-lts-announce/2021/10/msg00011.html", "https://lists.debian.org/debian-lts-announce/2023/10/msg00023.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4OOYAMJVLLCLXDTHW3V5UXNULZBBK4O6/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/AAC2AA36OTRHKSVM5OV7TTVB3CZIGEFL/", "https://www.debian.org/security/2020/dsa-4696", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpujan2021.html", "https://www.oracle.com/security-alerts/cpujul2020.html", "https://www.oracle.com/security-alerts/cpuoct2020.html"]

[[affected]]
pkg = "nghttp2_jll"
ranges = ["< 1.41.0+0"]

[[jlsec_sources]]
id = "CVE-2020-11080"
imported = 2025-10-22T22:35:52.395Z
modified = 2024-11-21T04:56:44.657Z
published = 2020-06-03T23:15:11.073Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-11080"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-11080"
```

# In nghttp2 before version 1.41.0, the overly large HTTP/2 SETTINGS frame payload causes denial of se...

In nghttp2 before version 1.41.0, the overly large HTTP/2 SETTINGS frame payload causes denial of service. The proof of concept attack involves a malicious client constructing a SETTINGS frame with a length of 14,400 bytes (2400 individual settings entries) over and over again. The attack causes the CPU to spike at 100%. nghttp2 v1.41.0 fixes this vulnerability. There is a workaround to this vulnerability. Implement nghttp2_on_frame_recv_callback callback, and if received frame is SETTINGS frame and the number of settings entries are large (e.g., > 32), then drop the connection.

