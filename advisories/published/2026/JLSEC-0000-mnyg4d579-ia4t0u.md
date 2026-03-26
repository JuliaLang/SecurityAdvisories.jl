```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d579-ia4t0u"
modified = 2026-03-26T21:18:48.213Z
upstream = ["CVE-2001-0872"]
references = ["ftp://ftp.caldera.com/pub/security/OpenLinux/CSSA-2001-042.1.txt", "http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000446", "http://frontal2.mandriva.com/security/advisories?name=MDKSA-2001:092", "http://lists.suse.com/archives/suse-security-announce/2001-Dec/0001.html", "http://marc.info/?l=bugtraq&m=100749779131514&w=2", "http://marc.info/?l=openssh-unix-dev&m=100747128105913&w=2", "http://www.ciac.org/ciac/bulletins/m-026.shtml", "http://www.debian.org/security/2001/dsa-091", "http://www.kb.cert.org/vuls/id/157447", "http://www.osvdb.org/688", "http://www.redhat.com/support/errata/RHSA-2001-161.html", "http://www.securityfocus.com/bid/3614", "http://www1.itrc.hp.com/service/cki/docDisplay.do?docId=HPSBUX0112-005", "https://exchange.xforce.ibmcloud.com/vulnerabilities/7647", "ftp://ftp.caldera.com/pub/security/OpenLinux/CSSA-2001-042.1.txt", "http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000446", "http://frontal2.mandriva.com/security/advisories?name=MDKSA-2001:092", "http://lists.suse.com/archives/suse-security-announce/2001-Dec/0001.html", "http://marc.info/?l=bugtraq&m=100749779131514&w=2", "http://marc.info/?l=openssh-unix-dev&m=100747128105913&w=2", "http://www.ciac.org/ciac/bulletins/m-026.shtml", "http://www.debian.org/security/2001/dsa-091", "http://www.kb.cert.org/vuls/id/157447", "http://www.osvdb.org/688", "http://www.redhat.com/support/errata/RHSA-2001-161.html", "http://www.securityfocus.com/bid/3614", "http://www1.itrc.hp.com/service/cki/docDisplay.do?docId=HPSBUX0112-005", "https://exchange.xforce.ibmcloud.com/vulnerabilities/7647"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2001-0872"
imported = 2026-03-26T21:18:48.213Z
modified = 2025-04-03T01:03:51.193Z
published = 2001-12-21T05:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2001-0872"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2001-0872"
```

# OpenSSH 3.0.1 and earlier with UseLogin enabled does not properly cleanse critical environment varia...

OpenSSH 3.0.1 and earlier with UseLogin enabled does not properly cleanse critical environment variables such as LD_PRELOAD, which allows local users to gain root privileges.

