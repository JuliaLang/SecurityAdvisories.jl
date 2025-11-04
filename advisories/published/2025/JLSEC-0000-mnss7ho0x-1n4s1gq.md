```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss7ho0x-1n4s1gq"
modified = 2025-11-04T04:21:18.177Z
upstream = ["CVE-2024-13978"]
references = ["http://www.libtiff.org/", "https://gitlab.com/libtiff/libtiff/-/commit/2ebfffb0e8836bfb1cd7d85c059cd285c59761a4", "https://gitlab.com/libtiff/libtiff/-/issues/649", "https://gitlab.com/libtiff/libtiff/-/merge_requests/667", "https://vuldb.com/?ctiid.318355", "https://vuldb.com/?id.318355", "https://vuldb.com/?submit.624562", "https://lists.debian.org/debian-lts-announce/2025/09/msg00031.html", "https://gitlab.com/libtiff/libtiff/-/issues/649"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.7.2+0"]

[[jlsec_sources]]
id = "CVE-2024-13978"
imported = 2025-11-04T04:21:18.177Z
modified = 2025-11-03T19:15:42.683Z
published = 2025-08-01T22:15:25.320Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-13978"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-13978"
```

# A vulnerability was found in LibTIFF up to 4.7.0

A vulnerability was found in LibTIFF up to 4.7.0. It has been declared as problematic. Affected by this vulnerability is the function t2p_read_tiff_init of the file tools/tiff2pdf.c of the component fax2ps. The manipulation leads to null pointer dereference. The attack needs to be approached locally. The complexity of an attack is rather high. The exploitation appears to be difficult. The patch is named 2ebfffb0e8836bfb1cd7d85c059cd285c59761a4. It is recommended to apply a patch to fix this issue.

