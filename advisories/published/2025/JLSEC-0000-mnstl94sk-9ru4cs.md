```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl94sk-9ru4cs"
modified = 2025-11-05T03:34:20.804Z
upstream = ["CVE-2024-25580"]
references = ["https://www.qt.io/blog/security-advisory-potential-buffer-overflow-when-reading-ktx-images", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/SYE2NMN67DYHYJKLAKLGR64OYI7A63AH/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/ZWTGLKC3WBDHZ5OJRSEB2QUR7XXZDLZV/", "https://www.qt.io/blog/security-advisory-potential-buffer-overflow-when-reading-ktx-images"]

[[affected]]
pkg = "Qt5Base_jll"
ranges = ["*"]
[[affected]]
pkg = "Qt_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-25580"
imported = 2025-11-05T03:34:20.804Z
modified = 2025-11-04T19:17:00.520Z
published = 2024-03-27T03:15:12.007Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-25580"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-25580"
```

# An issue was discovered in gui/util/qktxhandler.cpp in Qt before 5.15.17, 6.x before 6.2.12, 6.3.x t...

An issue was discovered in gui/util/qktxhandler.cpp in Qt before 5.15.17, 6.x before 6.2.12, 6.3.x through 6.5.x before 6.5.5, and 6.6.x before 6.6.2. A buffer overflow and application crash can occur via a crafted KTX image file.

