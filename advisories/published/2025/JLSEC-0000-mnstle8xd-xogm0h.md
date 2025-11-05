```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstle8xd-xogm0h"
modified = 2025-11-05T03:38:19.441Z
upstream = ["CVE-2024-41957"]
references = ["https://github.com/vim/vim/commit/8a0bbe7b8aad6f8da28dee218c01bc8a0185a", "https://github.com/vim/vim/security/advisories/GHSA-f9cr-gv85-hcr4", "http://seclists.org/fulldisclosure/2024/Sep/33", "http://www.openwall.com/lists/oss-security/2024/08/01/1", "https://security.netapp.com/advisory/ntap-20241129-0007/"]

[[affected]]
pkg = "Vim_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-41957"
imported = 2025-11-05T03:38:19.440Z
modified = 2025-11-04T17:16:02.977Z
published = 2024-08-01T22:15:29.367Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-41957"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-41957"
```

# Vim is an open source command line text editor

Vim is an open source command line text editor. Vim < v9.1.0647 has double free in src/alloc.c:616. When closing a window, the corresponding tagstack data will be cleared and freed. However a bit later, the quickfix list belonging to that window will also be cleared and if that quickfix list points to the same tagstack data, Vim will try to free it again, resulting in a double-free/use-after-free access exception. Impact is low since the user must intentionally execute vim with several non-default flags,
but it may cause a crash of Vim. The issue has been fixed as of Vim patch v9.1.0647

