```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvzwklsj-1wmwd9n"
modified = 2026-01-24T03:36:55.891Z
upstream = ["CVE-2025-2912"]
references = ["https://github.com/HDFGroup/hdf5/issues/5370", "https://vuldb.com/?ctiid.301885", "https://vuldb.com/?id.301885", "https://vuldb.com/?submit.519966"]

[[affected]]
pkg = "HDF5_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-2912"
imported = 2026-01-24T03:36:55.869Z
modified = 2026-01-23T20:50:01.533Z
published = 2025-03-28T16:15:30.540Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-2912"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-2912"
```

# A vulnerability was found in HDF5 up to 1.14.6

A vulnerability was found in HDF5 up to 1.14.6. It has been declared as problematic. Affected by this vulnerability is the function H5O_msg_flush of the file src/H5Omessage.c. The manipulation of the argument oh leads to heap-based buffer overflow. The attack needs to be approached locally. The exploit has been disclosed to the public and may be used.

