```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns6clncu-j4sajk"
modified = 2025-10-19T21:13:26.142Z
upstream = ["CVE-2025-4056"]
references = ["https://access.redhat.com/security/cve/CVE-2025-4056", "https://bugzilla.redhat.com/show_bug.cgi?id=2362826", "https://gitlab.gnome.org/GNOME/glib/-/issues/3668"]

[[affected]]
pkg = "Glib_jll"
ranges = ["< 2.84.3+0"]

[[jlsec_sources]]
id = "CVE-2025-4056"
imported = 2025-10-19T21:13:26.142Z
modified = 2025-08-13T19:40:02.767Z
published = 2025-07-28T13:15:30.177Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-4056"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-4056"
```

# A flaw was found in GLib

A flaw was found in GLib. A denial of service on Windows platforms may occur if an application attempts to spawn a program using long command lines.

