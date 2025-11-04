```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5j1od-1db0usa"
modified = 2025-11-04T03:26:23.293Z
upstream = ["CVE-2022-4415"]
references = ["https://github.com/systemd/systemd/commit/b7641425659243c09473cd8fb3aef2c0d4a3eb9c", "https://www.openwall.com/lists/oss-security/2022/12/21/3", "http://seclists.org/fulldisclosure/2025/Jun/9", "https://github.com/systemd/systemd/commit/b7641425659243c09473cd8fb3aef2c0d4a3eb9c", "https://security.netapp.com/advisory/ntap-20230216-0010/", "https://www.openwall.com/lists/oss-security/2022/12/21/3"]

[[affected]]
pkg = "systemd_jll"
ranges = ["< 256.7.0+0"]

[[jlsec_sources]]
id = "CVE-2022-4415"
imported = 2025-11-04T03:26:23.293Z
modified = 2025-11-03T20:15:59.413Z
published = 2023-01-11T15:15:09.590Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-4415"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-4415"
```

# A vulnerability was found in systemd

A vulnerability was found in systemd. This security flaw can cause a local information leak due to systemd-coredump not respecting the fs.suid_dumpable kernel setting.

