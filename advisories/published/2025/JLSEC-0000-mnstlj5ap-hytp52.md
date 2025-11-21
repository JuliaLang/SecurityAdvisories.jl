```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstlj5ap-hytp52"
modified = 2025-11-05T03:42:08.017Z
upstream = ["CVE-2025-53906"]
references = ["https://github.com/vim/vim/commit/586294a04179d855c3d1d4ee5ea83931963680b8", "https://github.com/vim/vim/security/advisories/GHSA-r2fw-9cw4-mj86", "http://www.openwall.com/lists/oss-security/2025/07/15/2", "https://github.com/vim/vim/security/advisories/GHSA-r2fw-9cw4-mj86"]

[[affected]]
pkg = "Vim_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-53906"
imported = 2025-11-05T03:42:08.017Z
modified = 2025-11-04T22:16:27.293Z
published = 2025-07-15T21:15:34.493Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-53906"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-53906"
```

# Vim is an open source, command line text editor

Vim is an open source, command line text editor. Prior to version 9.1.1551, a path traversal issue in Vim’s zip.vim plugin can allow overwriting of arbitrary files when opening specially crafted zip archives. Impact is low because this exploit requires direct user interaction. However, successfully exploitation can lead to overwriting sensitive files or placing executable code in privileged locations, depending on the permissions of the process editing the archive. The victim must edit such a file using Vim which will reveal the filename and the file content, a careful user may suspect some strange things going on. Successful exploitation could results in the ability to execute arbitrary commands on the underlying operating system. Version 9.1.1551 contains a patch for the vulnerability.

