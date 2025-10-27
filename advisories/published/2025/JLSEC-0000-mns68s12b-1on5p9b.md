```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns68s12b-1on5p9b"
modified = 2025-10-19T19:26:25.379Z
upstream = ["CVE-2025-1632"]
references = ["https://github.com/Ekkosun/pocs/blob/main/bsdunzip-poc", "https://vuldb.com/?ctiid.296619", "https://vuldb.com/?id.296619", "https://vuldb.com/?submit.496460", "https://github.com/Ekkosun/pocs/blob/main/bsdunzip-poc"]

[[affected]]
pkg = "LibArchive_jll"
ranges = ["< 3.7.9+0"]

[[jlsec_sources]]
id = "CVE-2025-1632"
imported = 2025-10-19T19:26:25.379Z
modified = 2025-03-25T15:41:41.683Z
published = 2025-02-24T14:15:11.590Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-1632"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-1632"
```

# A vulnerability was found in libarchive up to 3.7.7

A vulnerability was found in libarchive up to 3.7.7. It has been classified as problematic. This affects the function list of the file bsdunzip.c. The manipulation leads to null pointer dereference. It is possible to launch the attack on the local host. The exploit has been disclosed to the public and may be used. The vendor was contacted early about this disclosure but did not respond in any way.

