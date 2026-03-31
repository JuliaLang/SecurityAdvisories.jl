```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnymvf751-11iuzpg"
modified = 2026-03-31T14:42:50.725Z
upstream = ["CVE-2019-20633"]
references = ["https://savannah.gnu.org/bugs/index.php?56683", "https://savannah.gnu.org/bugs/index.php?56683"]

[[affected]]
pkg = "patch_jll"
ranges = ["< 2.8.0+0"]

[[jlsec_sources]]
id = "CVE-2019-20633"
imported = 2026-03-31T14:42:50.725Z
modified = 2024-11-21T04:38:55.590Z
published = 2020-03-25T17:15:14.013Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-20633"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-20633"
```

GNU patch through 2.7.6 contains a free(p_line[p_end]) Double Free vulnerability in the function another_hunk in pch.c that can cause a denial of service via a crafted patch file. NOTE: this issue exists because of an incomplete fix for CVE-2018-6952.

