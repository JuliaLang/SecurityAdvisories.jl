```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d5ug-1sorvci"
modified = 2026-03-26T21:18:49.048Z
upstream = ["CVE-2004-1653"]
references = ["http://marc.info/?l=bugtraq&m=109413637313484&w=2", "http://securitytracker.com/id?1011143", "http://www.osvdb.org/9562", "https://exchange.xforce.ibmcloud.com/vulnerabilities/17213", "https://security.netapp.com/advisory/ntap-20191107-0001/", "http://marc.info/?l=bugtraq&m=109413637313484&w=2", "http://securitytracker.com/id?1011143", "http://www.osvdb.org/9562", "https://exchange.xforce.ibmcloud.com/vulnerabilities/17213", "https://security.netapp.com/advisory/ntap-20191107-0001/"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2004-1653"
imported = 2026-03-26T21:18:49.048Z
modified = 2025-04-03T01:03:51.193Z
published = 2004-08-31T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2004-1653"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2004-1653"
```

# The default configuration for OpenSSH enables AllowTcpForwarding, which could allow remote authentic...

The default configuration for OpenSSH enables AllowTcpForwarding, which could allow remote authenticated users to perform a port bounce, when configured with an anonymous access program such as AnonCVS.

