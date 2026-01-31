```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw9x32sy-1mgy42k"
modified = 2026-01-31T03:48:59.506Z
upstream = ["CVE-2025-66476"]
references = ["https://github.com/vim/vim/commit/083ec6d9a3b7b09006e0ce69ac802597d25", "https://github.com/vim/vim/releases/tag/v9.1.1947", "https://github.com/vim/vim/security/advisories/GHSA-g77q-xrww-p834", "http://www.openwall.com/lists/oss-security/2025/12/02/5"]

[[affected]]
pkg = "Vim_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-66476"
imported = 2026-01-31T03:48:59.506Z
modified = 2026-01-30T18:50:29.877Z
published = 2025-12-02T22:16:09.940Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-66476"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-66476"
```

# Vim is an open source, command line text editor

Vim is an open source, command line text editor. Prior to version 9.1.1947, an uncontrolled search path vulnerability on Windows allows Vim to execute malicious executables placed in the current working directory for the current edited file. On Windows, when using cmd.exe as a shell, Vim resolves external commands by searching the current working directory before system paths. When Vim invokes tools such as findstr for :grep, external commands or filters via :!, or compiler/:make commands, it may inadvertently run a malicious executable present in the same directory as the file being edited. The issue affects Vim for Windows prior to version 9.1.1947.

