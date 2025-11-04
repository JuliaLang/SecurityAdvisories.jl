```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5sjqn-kq0tt2"
modified = 2025-11-04T03:33:46.607Z
upstream = ["CVE-2024-7006"]
references = ["https://access.redhat.com/errata/RHSA-2024:6360", "https://access.redhat.com/errata/RHSA-2024:8833", "https://access.redhat.com/errata/RHSA-2024:8914", "https://access.redhat.com/security/cve/CVE-2024-7006", "https://bugzilla.redhat.com/show_bug.cgi?id=2302996", "https://lists.debian.org/debian-lts-announce/2025/01/msg00019.html", "https://security.netapp.com/advisory/ntap-20240920-0001/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.7.0+0"]

[[jlsec_sources]]
id = "CVE-2024-7006"
imported = 2025-11-04T03:33:46.607Z
modified = 2025-11-03T21:18:47.940Z
published = 2024-08-12T13:38:40.577Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-7006"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-7006"
```

# A null pointer dereference flaw was found in Libtiff via `tif_dirinfo.c`

A null pointer dereference flaw was found in Libtiff via `tif_dirinfo.c`. This issue may allow an attacker to trigger memory allocation failures through certain means, such as restricting the heap space size or injecting faults, causing a segmentation fault. This can cause an application crash, eventually leading to a denial of service.

