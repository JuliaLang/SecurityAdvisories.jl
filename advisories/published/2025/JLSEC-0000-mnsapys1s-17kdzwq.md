```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsapys1s-17kdzwq"
modified = 2025-10-22T22:38:38.464Z
upstream = ["CVE-2022-44940"]
references = ["https://github.com/NixOS/patchelf/pull/419", "https://github.com/NixOS/patchelf/pull/419"]

[[affected]]
pkg = "Patchelf_jll"
ranges = [">= 2019.10.23+0"]

[[jlsec_sources]]
id = "CVE-2022-44940"
imported = 2025-10-22T22:38:38.439Z
modified = 2025-04-17T15:15:50.040Z
published = 2022-12-19T22:15:11.077Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-44940"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-44940"
```

# Patchelf v0.9 was discovered to contain an out-of-bounds read via the function modifyRPath at src/pa...

Patchelf v0.9 was discovered to contain an out-of-bounds read via the function modifyRPath at src/patchelf.cc.

