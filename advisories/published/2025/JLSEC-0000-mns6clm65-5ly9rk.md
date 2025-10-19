```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns6clm65-5ly9rk"
modified = 2025-10-19T21:13:24.605Z
upstream = ["CVE-2023-32636"]
references = ["https://gitlab.gnome.org/GNOME/glib/-/issues/2841", "https://https://discourse.gnome.org/t/multiple-fixes-for-gvariant-normalisation-issues-in-glib/12835", "https://security.netapp.com/advisory/ntap-20231110-0002/", "https://gitlab.gnome.org/GNOME/glib/-/issues/2841", "https://https://discourse.gnome.org/t/multiple-fixes-for-gvariant-normalisation-issues-in-glib/12835", "https://security.netapp.com/advisory/ntap-20231110-0002/"]

[[affected]]
pkg = "Glib_jll"
ranges = ["< 2.76.5+0"]
[[affected]]
pkg = "GlibNetworking_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-32636"
imported = 2025-10-19T21:13:24.605Z
modified = 2024-11-21T08:03:44.800Z
published = 2023-09-14T20:15:09.653Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-32636"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-32636"
```

# A flaw was found in glib, where the gvariant deserialization code is vulnerable to a denial of servi...

A flaw was found in glib, where the gvariant deserialization code is vulnerable to a denial of service introduced by additional input validation added to resolve CVE-2023-29499. The offset table validation may be very slow. This bug does not affect any released version of glib but does affect glib distributors who followed the guidance of glib developers to backport the initial fix for CVE-2023-29499.

