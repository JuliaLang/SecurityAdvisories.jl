```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntdl68eg-1wzj50p"
modified = 2025-11-19T03:27:29.032Z
upstream = ["CVE-2024-3566"]
references = ["https://flatt.tech/research/posts/batbadbut-you-cant-securely-execute-commands-on-windows/", "https://kb.cert.org/vuls/id/123335", "https://learn.microsoft.com/en-us/archive/blogs/twistylittlepassagesallalike/everyone-quotes-command-line-arguments-the-wrong-way", "https://www.cve.org/CVERecord?id=CVE-2024-1874", "https://www.cve.org/CVERecord?id=CVE-2024-22423", "https://www.cve.org/CVERecord?id=CVE-2024-24576", "https://www.kb.cert.org/vuls/id/123335", "https://flatt.tech/research/posts/batbadbut-you-cant-securely-execute-commands-on-windows/", "https://github.com/nu11secur1ty/Windows11Exploits/tree/main/2024/CVE-2024-3566", "https://kb.cert.org/vuls/id/123335", "https://learn.microsoft.com/en-us/archive/blogs/twistylittlepassagesallalike/everyone-quotes-command-line-arguments-the-wrong-way", "https://www.cve.org/CVERecord?id=CVE-2024-1874", "https://www.cve.org/CVERecord?id=CVE-2024-22423", "https://www.cve.org/CVERecord?id=CVE-2024-24576", "https://www.kb.cert.org/vuls/id/123335"]

[[affected]]
pkg = "libnode_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-3566"
imported = 2025-11-19T03:27:29.032Z
modified = 2025-11-18T18:16:05.353Z
published = 2024-04-10T16:15:16.083Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-3566"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-3566"
```

# A command inject vulnerability allows an attacker to perform command injection on Windows applicatio...

A command inject vulnerability allows an attacker to perform command injection on Windows applications that indirectly depend on the CreateProcess function when the specific conditions are satisfied.

