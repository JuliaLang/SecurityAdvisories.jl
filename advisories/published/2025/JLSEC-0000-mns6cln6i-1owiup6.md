```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns6cln6i-1owiup6"
modified = 2025-10-19T21:13:25.914Z
upstream = ["CVE-2024-52533"]
references = ["https://gitlab.gnome.org/GNOME/glib/-/issues/3461", "https://gitlab.gnome.org/GNOME/glib/-/releases/2.82.1", "https://gitlab.gnome.org/Teams/Releng/security/-/wikis/home", "http://www.openwall.com/lists/oss-security/2024/11/12/11", "https://lists.debian.org/debian-lts-announce/2024/11/msg00020.html", "https://security.netapp.com/advisory/ntap-20241206-0009/"]

[[affected]]
pkg = "Glib_jll"
ranges = ["< 2.82.2+0"]

[[jlsec_sources]]
id = "CVE-2024-52533"
imported = 2025-10-19T21:13:25.914Z
modified = 2025-06-17T01:23:56.150Z
published = 2024-11-11T23:15:05.967Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-52533"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-52533"
```

# gio/gsocks4aproxy.c in GNOME GLib before 2.82.1 has an off-by-one error and resultant buffer overflo...

gio/gsocks4aproxy.c in GNOME GLib before 2.82.1 has an off-by-one error and resultant buffer overflow because SOCKS4_CONN_MSG_LEN is not sufficient for a trailing '\0' character.

