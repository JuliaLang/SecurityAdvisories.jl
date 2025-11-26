```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnau9ye-4o8ov2"
modified = 2025-11-25T22:35:56.774Z
upstream = ["CVE-2004-0817"]
references = ["http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000870", "http://sunsolve.sun.com/search/document.do?assetkey=1-66-201611-1", "http://www.debian.org/security/2004/dsa-548", "http://www.gentoo.org/security/en/glsa/glsa-200409-12.xml", "http://www.mandriva.com/security/advisories?name=MDKSA-2004:089", "http://www.redhat.com/support/errata/RHSA-2004-465.html", "http://www.securityfocus.com/bid/11084", "https://exchange.xforce.ibmcloud.com/vulnerabilities/17182", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A8843", "http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000870", "http://sunsolve.sun.com/search/document.do?assetkey=1-66-201611-1", "http://www.debian.org/security/2004/dsa-548", "http://www.gentoo.org/security/en/glsa/glsa-200409-12.xml", "http://www.mandriva.com/security/advisories?name=MDKSA-2004:089", "http://www.redhat.com/support/errata/RHSA-2004-465.html", "http://www.securityfocus.com/bid/11084", "https://exchange.xforce.ibmcloud.com/vulnerabilities/17182", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A8843"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2004-0817"
imported = 2025-11-25T22:35:56.774Z
modified = 2025-04-03T01:03:51.193Z
published = 2004-12-31T05:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2004-0817"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2004-0817"
```

# Multiple heap-based buffer overflows in the imlib BMP image handler allow remote attackers to execut...

Multiple heap-based buffer overflows in the imlib BMP image handler allow remote attackers to execute arbitrary code via a crafted BMP file.

