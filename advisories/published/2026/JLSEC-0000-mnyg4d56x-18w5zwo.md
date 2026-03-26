```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d56x-18w5zwo"
modified = 2026-03-26T21:18:48.201Z
upstream = ["CVE-2001-1380"]
references = ["http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000431", "http://download.immunix.org/ImmunixOS/7.0/updates/IMNX-2001-70-034-01", "http://marc.info/?l=bugtraq&m=100154541809940&w=2", "http://rhn.redhat.com/errata/RHSA-2001-114.html", "http://www.ciac.org/ciac/bulletins/m-010.shtml", "http://www.kb.cert.org/vuls/id/905795", "http://www.linux-mandrake.com/en/security/2001/MDKSA-2001-081.php", "http://www.osvdb.org/642", "http://www.securityfocus.com/bid/3369", "https://exchange.xforce.ibmcloud.com/vulnerabilities/7179", "http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000431", "http://download.immunix.org/ImmunixOS/7.0/updates/IMNX-2001-70-034-01", "http://marc.info/?l=bugtraq&m=100154541809940&w=2", "http://rhn.redhat.com/errata/RHSA-2001-114.html", "http://www.ciac.org/ciac/bulletins/m-010.shtml", "http://www.kb.cert.org/vuls/id/905795", "http://www.linux-mandrake.com/en/security/2001/MDKSA-2001-081.php", "http://www.osvdb.org/642", "http://www.securityfocus.com/bid/3369", "https://exchange.xforce.ibmcloud.com/vulnerabilities/7179"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.2.0+0"]

[[jlsec_sources]]
id = "CVE-2001-1380"
imported = 2026-03-26T21:18:48.201Z
modified = 2025-04-03T01:03:51.193Z
published = 2001-10-18T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2001-1380"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2001-1380"
```

# OpenSSH before 2.9.9, while using keypairs and multiple keys of different types in the ~/.ssh/author...

OpenSSH before 2.9.9, while using keypairs and multiple keys of different types in the ~/.ssh/authorized_keys2 file, may not properly handle the "from" option associated with a key, which could allow remote attackers to login from unauthorized IP addresses.

