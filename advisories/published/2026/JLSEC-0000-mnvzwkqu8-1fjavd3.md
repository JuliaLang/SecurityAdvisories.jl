```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvzwkqu8-1fjavd3"
modified = 2026-01-24T03:37:02.432Z
upstream = ["CVE-2025-6270"]
references = ["https://github.com/HDFGroup/hdf5/issues/5580", "https://github.com/user-attachments/files/20626642/reproduce.tar.gz", "https://vuldb.com/?ctiid.313274", "https://vuldb.com/?id.313274", "https://vuldb.com/?submit.592588", "https://github.com/HDFGroup/hdf5/issues/5580"]

[[affected]]
pkg = "HDF5_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-6270"
imported = 2026-01-24T03:37:02.432Z
modified = 2026-01-23T20:49:00.920Z
published = 2025-06-19T17:15:27.167Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-6270"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-6270"
```

# A vulnerability, which was classified as critical, has been found in HDF5 up to 1.14.6

A vulnerability, which was classified as critical, has been found in HDF5 up to 1.14.6. Affected by this issue is the function H5FS__sect_find_node of the file H5FSsection.c. The manipulation leads to heap-based buffer overflow. It is possible to launch the attack on the local host. The exploit has been disclosed to the public and may be used.

