```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntdl6acu-wy3oqc"
modified = 2025-11-19T03:27:31.566Z
upstream = ["CVE-2025-2784"]
references = ["https://access.redhat.com/errata/RHSA-2025:21657", "https://access.redhat.com/errata/RHSA-2025:7505", "https://access.redhat.com/errata/RHSA-2025:8126", "https://access.redhat.com/errata/RHSA-2025:8132", "https://access.redhat.com/errata/RHSA-2025:8139", "https://access.redhat.com/errata/RHSA-2025:8140", "https://access.redhat.com/errata/RHSA-2025:8252", "https://access.redhat.com/errata/RHSA-2025:8480", "https://access.redhat.com/errata/RHSA-2025:8481", "https://access.redhat.com/errata/RHSA-2025:8482", "https://access.redhat.com/errata/RHSA-2025:8663", "https://access.redhat.com/errata/RHSA-2025:9179", "https://access.redhat.com/security/cve/CVE-2025-2784", "https://bugzilla.redhat.com/show_bug.cgi?id=2354669", "https://gitlab.gnome.org/GNOME/libsoup/-/issues/422", "https://lists.debian.org/debian-lts-announce/2025/04/msg00036.html", "https://gitlab.gnome.org/GNOME/libsoup/-/issues/422"]

[[affected]]
pkg = "Soup3_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-2784"
imported = 2025-11-19T03:27:31.566Z
modified = 2025-11-18T09:15:50.430Z
published = 2025-04-03T03:15:18.113Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-2784"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-2784"
```

# A flaw was found in libsoup

A flaw was found in libsoup. The package is vulnerable to a heap buffer over-read when sniffing content via the skip_insight_whitespace() function. Libsoup clients may read one byte out-of-bounds in response to a crafted HTTP response by an HTTP server.

