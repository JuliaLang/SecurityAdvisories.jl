```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d560-etxyh6"
modified = 2026-03-26T21:18:48.168Z
upstream = ["CVE-2001-0529"]
references = ["ftp://ftp.netbsd.org/pub/NetBSD/security/advisories/NetBSD-SA2001-010.txt.asc", "http://archives.neohapsis.com/archives/bugtraq/2001-05/0322.html", "http://archives.neohapsis.com/archives/bugtraq/2001-06/0007.html", "http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000431", "http://download.immunix.org/ImmunixOS/7.0/updates/IMNX-2001-70-034-01", "http://online.securityfocus.com/archive/1/188737", "http://www.calderasystems.com/support/security/advisories/CSSA-2001-023.0.txt", "http://www.kb.cert.org/vuls/id/655259", "http://www.openbsd.org/errata29.html", "http://www.osvdb.org/1853", "http://www.securityfocus.com/bid/2825", "https://exchange.xforce.ibmcloud.com/vulnerabilities/6676", "ftp://ftp.netbsd.org/pub/NetBSD/security/advisories/NetBSD-SA2001-010.txt.asc", "http://archives.neohapsis.com/archives/bugtraq/2001-05/0322.html", "http://archives.neohapsis.com/archives/bugtraq/2001-06/0007.html", "http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000431", "http://download.immunix.org/ImmunixOS/7.0/updates/IMNX-2001-70-034-01", "http://online.securityfocus.com/archive/1/188737", "http://www.calderasystems.com/support/security/advisories/CSSA-2001-023.0.txt", "http://www.kb.cert.org/vuls/id/655259", "http://www.openbsd.org/errata29.html", "http://www.osvdb.org/1853", "http://www.securityfocus.com/bid/2825", "https://exchange.xforce.ibmcloud.com/vulnerabilities/6676"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.2.0+0"]

[[jlsec_sources]]
id = "CVE-2001-0529"
imported = 2026-03-26T21:18:48.168Z
modified = 2025-04-03T01:03:51.193Z
published = 2001-08-14T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2001-0529"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2001-0529"
```

# OpenSSH version 2.9 and earlier, with X forwarding enabled, allows a local attacker to delete any fi...

OpenSSH version 2.9 and earlier, with X forwarding enabled, allows a local attacker to delete any file named 'cookies' via a symlink attack.

