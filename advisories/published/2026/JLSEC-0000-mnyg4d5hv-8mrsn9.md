```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d5hv-8mrsn9"
modified = 2026-03-26T21:18:48.595Z
upstream = ["CVE-2003-0695"]
references = ["http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000741", "http://marc.info/?l=bugtraq&m=106373546332230&w=2", "http://marc.info/?l=bugtraq&m=106381396120332&w=2", "http://marc.info/?l=bugtraq&m=106381409220492&w=2", "http://marc.info/?l=bugtraq&m=106382542403716&w=2", "http://marc.info/?l=openbsd-security-announce&m=106375582924840", "http://www.debian.org/security/2003/dsa-382", "http://www.debian.org/security/2003/dsa-383", "http://www.mandriva.com/security/advisories?name=MDKSA-2003:090", "http://www.openssh.com/txt/buffer.adv", "http://www.redhat.com/support/errata/RHSA-2003-280.html", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A452", "http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000741", "http://marc.info/?l=bugtraq&m=106373546332230&w=2", "http://marc.info/?l=bugtraq&m=106381396120332&w=2", "http://marc.info/?l=bugtraq&m=106381409220492&w=2", "http://marc.info/?l=bugtraq&m=106382542403716&w=2", "http://marc.info/?l=openbsd-security-announce&m=106375582924840", "http://www.debian.org/security/2003/dsa-382", "http://www.debian.org/security/2003/dsa-383", "http://www.mandriva.com/security/advisories?name=MDKSA-2003:090", "http://www.openssh.com/txt/buffer.adv", "http://www.redhat.com/support/errata/RHSA-2003-280.html", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A452"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2003-0695"
imported = 2026-03-26T21:18:48.595Z
modified = 2025-04-03T01:03:51.193Z
published = 2003-10-06T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2003-0695"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2003-0695"
```

# Multiple "buffer management errors" in OpenSSH before 3.7.1 may allow attackers to cause a denial of...

Multiple "buffer management errors" in OpenSSH before 3.7.1 may allow attackers to cause a denial of service or execute arbitrary code using (1) buffer_init in buffer.c, (2) buffer_free in buffer.c, or (3) a separate function in channels.c, a different vulnerability than CVE-2003-0693.

