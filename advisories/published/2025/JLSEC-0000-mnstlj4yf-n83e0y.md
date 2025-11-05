```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstlj4yf-n83e0y"
modified = 2025-11-05T03:42:07.575Z
upstream = ["CVE-2025-53905"]
references = ["https://github.com/vim/vim/commit/87757c6b0a4b2c1f71c72ea8e1438b8fb116b239", "https://github.com/vim/vim/security/advisories/GHSA-74v4-f3x9-ppvr", "http://www.openwall.com/lists/oss-security/2025/07/15/1", "https://github.com/vim/vim/security/advisories/GHSA-74v4-f3x9-ppvr"]

[[affected]]
pkg = "Vim_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-53905"
imported = 2025-11-05T03:42:07.575Z
modified = 2025-11-04T22:16:27.173Z
published = 2025-07-15T21:15:34.347Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-53905"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-53905"
```

# Vim is an open source, command line text editor

Vim is an open source, command line text editor. Prior to version 9.1.1552, a path traversal issue in Vim’s tar.vim plugin can allow overwriting of arbitrary files when opening specially crafted tar archives. Impact is low because this exploit requires direct user interaction. However, successfully exploitation can lead to overwriting sensitive files or placing executable code in privileged locations, depending on the permissions of the process editing the archive. The victim must edit such a file using Vim which will reveal the filename and the file content, a careful user may suspect some strange things going on. Successful exploitation could results in the ability to execute arbitrary commands on the underlying operating system. Version 9.1.1552 contains a patch for the vulnerability.

