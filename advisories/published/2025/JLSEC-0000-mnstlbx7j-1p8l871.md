```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstlbx7j-1p8l871"
modified = 2025-11-05T03:36:30.943Z
upstream = ["CVE-2024-36048"]
references = ["https://codereview.qt-project.org/c/qt/qtnetworkauth/+/560317", "https://codereview.qt-project.org/c/qt/qtnetworkauth/+/560368", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RGB6KUPJFQWUBKXVDPJUMAD6KNJJEWPW/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZOOZZZSK5PNRHFGQMUGUHVYWLILFJCRS/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZPHAI3DKDCIU6XLNS6PV6GFS2PHH3GZM/", "https://codereview.qt-project.org/c/qt/qtnetworkauth/+/560317", "https://codereview.qt-project.org/c/qt/qtnetworkauth/+/560368", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RGB6KUPJFQWUBKXVDPJUMAD6KNJJEWPW/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZOOZZZSK5PNRHFGQMUGUHVYWLILFJCRS/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZPHAI3DKDCIU6XLNS6PV6GFS2PHH3GZM/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/RGB6KUPJFQWUBKXVDPJUMAD6KNJJEWPW/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/ZOOZZZSK5PNRHFGQMUGUHVYWLILFJCRS/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/ZPHAI3DKDCIU6XLNS6PV6GFS2PHH3GZM/"]

[[affected]]
pkg = "Qt5Base_jll"
ranges = ["*"]
[[affected]]
pkg = "Qt_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-36048"
imported = 2025-11-05T03:36:30.943Z
modified = 2025-11-04T22:16:01.917Z
published = 2024-05-18T21:15:47.673Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-36048"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-36048"
```

# QAbstractOAuth in Qt Network Authorization in Qt before 5.15.17, 6.x before 6.2.13, 6.3.x through 6....

QAbstractOAuth in Qt Network Authorization in Qt before 5.15.17, 6.x before 6.2.13, 6.3.x through 6.5.x before 6.5.6, and 6.6.x through 6.7.x before 6.7.1 uses only the time to seed the PRNG, which may result in guessable values.

