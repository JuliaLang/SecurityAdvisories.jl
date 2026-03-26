```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d5by-lnzqgz"
modified = 2026-03-26T21:18:48.382Z
upstream = ["CVE-2002-0639"]
references = ["ftp://ftp.caldera.com/pub/security/OpenLinux/CSSA-2002-030.0.txt", "http://archives.neohapsis.com/archives/bugtraq/2002-06/0335.html", "http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000502", "http://marc.info/?l=bugtraq&m=102514371522793&w=2", "http://marc.info/?l=bugtraq&m=102514631524575&w=2", "http://marc.info/?l=bugtraq&m=102521542826833&w=2", "http://www.cert.org/advisories/CA-2002-18.html", "http://www.debian.org/security/2002/dsa-134", "http://www.iss.net/security_center/static/9169.php", "http://www.kb.cert.org/vuls/id/369347", "http://www.linuxsecurity.com/advisories/other_advisory-2177.html", "http://www.mandrakesoft.com/security/advisories?name=MDKSA-2002:040", "http://www.osvdb.org/6245", "http://www.securityfocus.com/bid/5093", "http://www1.itrc.hp.com/service/cki/docDisplay.do?docId=HPSBUX0206-195", "https://twitter.com/RooneyMcNibNug/status/1152332585349111810", "https://web.archive.org/web/20080622172542/www.iss.net/threats/advise123.html", "ftp://ftp.caldera.com/pub/security/OpenLinux/CSSA-2002-030.0.txt", "http://archives.neohapsis.com/archives/bugtraq/2002-06/0335.html", "http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000502", "http://marc.info/?l=bugtraq&m=102514371522793&w=2", "http://marc.info/?l=bugtraq&m=102514631524575&w=2", "http://marc.info/?l=bugtraq&m=102521542826833&w=2", "http://www.cert.org/advisories/CA-2002-18.html", "http://www.debian.org/security/2002/dsa-134", "http://www.iss.net/security_center/static/9169.php", "http://www.kb.cert.org/vuls/id/369347", "http://www.linuxsecurity.com/advisories/other_advisory-2177.html", "http://www.mandrakesoft.com/security/advisories?name=MDKSA-2002:040", "http://www.osvdb.org/6245", "http://www.securityfocus.com/bid/5093", "http://www1.itrc.hp.com/service/cki/docDisplay.do?docId=HPSBUX0206-195", "https://twitter.com/RooneyMcNibNug/status/1152332585349111810", "https://web.archive.org/web/20080622172542/www.iss.net/threats/advise123.html"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = [">= 9.2.0+0, < 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2002-0639"
imported = 2026-03-26T21:18:48.382Z
modified = 2025-04-03T01:03:51.193Z
published = 2002-07-03T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2002-0639"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2002-0639"
```

# Integer overflow in sshd in OpenSSH 2.9.9 through 3.3 allows remote attackers to execute arbitrary c...

Integer overflow in sshd in OpenSSH 2.9.9 through 3.3 allows remote attackers to execute arbitrary code during challenge response authentication (ChallengeResponseAuthentication) when OpenSSH is using SKEY or BSD_AUTH authentication.

