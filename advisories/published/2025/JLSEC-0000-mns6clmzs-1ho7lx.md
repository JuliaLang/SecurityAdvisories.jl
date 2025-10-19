```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns6clmzs-1ho7lx"
modified = 2025-10-19T21:13:25.672Z
upstream = ["CVE-2024-34397"]
references = ["https://gitlab.gnome.org/GNOME/glib/-/issues/3268", "https://lists.debian.org/debian-lts-announce/2024/05/msg00008.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IRSFYAE5X23TNRWX7ZWEJOMISLCDSYNS/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LCDY3KA7G7D3DRXYTT46K6LFHS2KHWBH/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LL6HSJDXCXMLEIJBYV6CPOR4K2NTCTXW/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UNFJHISR4O6VFOHBFWH5I5WWMG37H63A/", "https://security.netapp.com/advisory/ntap-20240531-0008/", "https://www.openwall.com/lists/oss-security/2024/05/07/5", "https://gitlab.gnome.org/GNOME/glib/-/issues/3268", "https://lists.debian.org/debian-lts-announce/2024/05/msg00008.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IRSFYAE5X23TNRWX7ZWEJOMISLCDSYNS/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LCDY3KA7G7D3DRXYTT46K6LFHS2KHWBH/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LL6HSJDXCXMLEIJBYV6CPOR4K2NTCTXW/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UNFJHISR4O6VFOHBFWH5I5WWMG37H63A/", "https://security.netapp.com/advisory/ntap-20240531-0008/", "https://www.openwall.com/lists/oss-security/2024/05/07/5"]

[[affected]]
pkg = "Glib_jll"
ranges = ["< 2.80.2+0"]
[[affected]]
pkg = "GlibNetworking_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-34397"
imported = 2025-10-19T21:13:25.672Z
modified = 2025-06-18T14:36:02.700Z
published = 2024-05-07T18:15:08.350Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-34397"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-34397"
```

# An issue was discovered in GNOME GLib before 2.78.5, and 2.79.x and 2.80.x before 2.80.1

An issue was discovered in GNOME GLib before 2.78.5, and 2.79.x and 2.80.x before 2.80.1. When a GDBus-based client subscribes to signals from a trusted system service such as NetworkManager on a shared computer, other users of the same computer can send spoofed D-Bus signals that the GDBus-based client will wrongly interpret as having been sent by the trusted system service. This could lead to the GDBus-based client behaving incorrectly, with an application-dependent impact.

