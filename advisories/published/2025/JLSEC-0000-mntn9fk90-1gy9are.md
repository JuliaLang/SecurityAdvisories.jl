```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntn9fk90-1gy9are"
modified = 2025-11-25T21:56:30.660Z
upstream = ["CVE-2023-3316"]
references = ["https://gitlab.com/libtiff/libtiff/-/issues/515", "https://gitlab.com/libtiff/libtiff/-/merge_requests/468", "https://lists.debian.org/debian-lts-announce/2023/07/msg00034.html", "https://research.jfrog.com/vulnerabilities/libtiff-nullderef-dos-xray-522144/", "https://gitlab.com/libtiff/libtiff/-/issues/515", "https://gitlab.com/libtiff/libtiff/-/merge_requests/468", "https://lists.debian.org/debian-lts-announce/2023/07/msg00034.html", "https://lists.debian.org/debian-lts-announce/2025/01/msg00019.html", "https://research.jfrog.com/vulnerabilities/libtiff-nullderef-dos-xray-522144/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[[jlsec_sources]]
id = "CVE-2023-3316"
imported = 2025-11-25T21:56:30.660Z
modified = 2025-11-03T21:15:59.493Z
published = 2023-06-19T12:15:09.520Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-3316"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-3316"
```

# A NULL pointer dereference in TIFFClose() is caused by a failure to open an output file (non-existen...

A NULL pointer dereference in TIFFClose() is caused by a failure to open an output file (non-existent path or a path that requires permissions like /dev/null) while specifying zones.

