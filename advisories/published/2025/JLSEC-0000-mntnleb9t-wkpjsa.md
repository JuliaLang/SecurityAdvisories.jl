```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnleb9t-wkpjsa"
modified = 2025-11-26T03:31:27.761Z
upstream = ["CVE-2024-40896"]
references = ["https://gitlab.gnome.org/GNOME/libxml2/-/commit/1a8932303969907f6572b1b6aac4081c56adb5c6", "https://gitlab.gnome.org/GNOME/libxml2/-/issues/761", "https://security.netapp.com/advisory/ntap-20250228-0004/"]

[[affected]]
pkg = "XML2_jll"
ranges = [">= 2.11.5+0, < 2.13.3+0"]

[[jlsec_sources]]
id = "CVE-2024-40896"
imported = 2025-11-26T03:31:27.761Z
modified = 2025-11-25T13:32:32.960Z
published = 2024-12-23T17:15:08.400Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-40896"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-40896"
```

# In libxml2 2.11 before 2.11.9, 2.12 before 2.12.9, and 2.13 before 2.13.3, the SAX parser can produc...

In libxml2 2.11 before 2.11.9, 2.12 before 2.12.9, and 2.13 before 2.13.3, the SAX parser can produce events for external entities even if custom SAX handlers try to override entity content (by setting "checked"). This makes classic XXE attacks possible.

