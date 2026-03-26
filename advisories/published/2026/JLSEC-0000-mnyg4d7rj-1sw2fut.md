```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d7rj-1sw2fut"
modified = 2026-03-26T21:18:51.535Z
upstream = ["CVE-2008-3259"]
references = ["http://openssh.com/security.html", "http://secunia.com/advisories/31179", "http://www.openssh.com/txt/release-5.1", "http://www.securityfocus.com/bid/30339", "http://www.securitytracker.com/id?1020537", "http://www.vupen.com/english/advisories/2008/2148", "https://exchange.xforce.ibmcloud.com/vulnerabilities/43940", "http://openssh.com/security.html", "http://secunia.com/advisories/31179", "http://www.openssh.com/txt/release-5.1", "http://www.securityfocus.com/bid/30339", "http://www.securitytracker.com/id?1020537", "http://www.vupen.com/english/advisories/2008/2148", "https://exchange.xforce.ibmcloud.com/vulnerabilities/43940"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2008-3259"
imported = 2026-03-26T21:18:51.535Z
modified = 2025-04-09T00:30:58.490Z
published = 2008-07-22T16:41:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2008-3259"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2008-3259"
```

# OpenSSH before 5.1 sets the SO_REUSEADDR socket option when the X11UseLocalhost configuration settin...

OpenSSH before 5.1 sets the SO_REUSEADDR socket option when the X11UseLocalhost configuration setting is disabled, which allows local users on some platforms to hijack the X11 forwarding port via a bind to a single IP address, as demonstrated on the HP-UX platform.

