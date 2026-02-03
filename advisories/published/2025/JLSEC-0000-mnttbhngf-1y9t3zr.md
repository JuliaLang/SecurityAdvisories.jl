```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnttbhngf-1y9t3zr"
modified = 2025-11-30T03:40:44.415Z
upstream = ["CVE-2024-39936"]
references = ["https://codereview.qt-project.org/c/qt/qtbase/+/571601", "https://codereview.qt-project.org/c/qt/qtbase/+/571601", "https://lists.debian.org/debian-lts-announce/2025/11/msg00031.html"]

[[affected]]
pkg = "Qt5Base_jll"
ranges = ["*"]
[[affected]]
pkg = "Qt_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-39936"
imported = 2025-11-30T03:40:44.397Z
modified = 2025-11-29T13:15:45.893Z
published = 2024-07-04T21:15:10.180Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-39936"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-39936"
```

# An issue was discovered in HTTP2 in Qt before 5.15.18, 6.x before 6.2.13, 6.3.x through 6.5.x before...

An issue was discovered in HTTP2 in Qt before 5.15.18, 6.x before 6.2.13, 6.3.x through 6.5.x before 6.5.7, and 6.6.x through 6.7.x before 6.7.3. Code to make security-relevant decisions about an established connection may execute too early, because the encrypted() signal has not yet been emitted and processed..

