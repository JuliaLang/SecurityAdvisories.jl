```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnukgokn6-wa7w12"
modified = 2025-12-19T03:35:52.194Z
upstream = ["CVE-2019-6110"]
references = ["https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://cvsweb.openbsd.org/src/usr.bin/ssh/progressmeter.c", "https://cvsweb.openbsd.org/src/usr.bin/ssh/scp.c", "https://security.gentoo.org/glsa/201903-16", "https://security.netapp.com/advisory/ntap-20190213-0001/", "https://sintonen.fi/advisories/scp-client-multiple-vulnerabilities.txt", "https://www.exploit-db.com/exploits/46193/", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://cvsweb.openbsd.org/src/usr.bin/ssh/progressmeter.c", "https://cvsweb.openbsd.org/src/usr.bin/ssh/scp.c", "https://security.gentoo.org/glsa/201903-16", "https://security.netapp.com/advisory/ntap-20190213-0001/", "https://sintonen.fi/advisories/scp-client-multiple-vulnerabilities.txt", "https://www.exploit-db.com/exploits/46193/"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2019-6110"
imported = 2025-12-19T03:35:52.194Z
modified = 2025-12-18T15:15:47.940Z
published = 2019-01-31T18:29:00.807Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-6110"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-6110"
```

# In OpenSSH 7.9, due to accepting and displaying arbitrary stderr output from the server, a malicious...

In OpenSSH 7.9, due to accepting and displaying arbitrary stderr output from the server, a malicious server (or Man-in-The-Middle attacker) can manipulate the client output, for example to use ANSI control codes to hide additional files being transferred.

