```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnau9y9-dexmqp"
modified = 2025-11-25T22:35:56.769Z
upstream = ["CVE-2004-0802"]
references = ["http://cvs.sourceforge.net/viewcvs.py/enlightenment/e17/libs/imlib2/ChangeLog?rev=1.20&view=markup", "http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000870", "http://sunsolve.sun.com/search/document.do?assetkey=1-66-201611-1", "http://www.gentoo.org/security/en/glsa/glsa-200409-12.xml", "http://www.mandrakesecure.net/en/advisories/advisory.php?name=MDKSA-2004:089", "http://www.securityfocus.com/bid/11084", "http://www.vuxml.org/freebsd/ba005226-fb5b-11d8-9837-000c41e2cdad.html", "https://exchange.xforce.ibmcloud.com/vulnerabilities/17183", "http://cvs.sourceforge.net/viewcvs.py/enlightenment/e17/libs/imlib2/ChangeLog?rev=1.20&view=markup", "http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000870", "http://sunsolve.sun.com/search/document.do?assetkey=1-66-201611-1", "http://www.gentoo.org/security/en/glsa/glsa-200409-12.xml", "http://www.mandrakesecure.net/en/advisories/advisory.php?name=MDKSA-2004:089", "http://www.securityfocus.com/bid/11084", "http://www.vuxml.org/freebsd/ba005226-fb5b-11d8-9837-000c41e2cdad.html", "https://exchange.xforce.ibmcloud.com/vulnerabilities/17183"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2004-0802"
imported = 2025-11-25T22:35:56.769Z
modified = 2025-04-03T01:03:51.193Z
published = 2004-12-31T05:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2004-0802"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2004-0802"
```

# Buffer overflow in the BMP loader in imlib2 before 1.1.2 allows remote attackers to execute arbitrar...

Buffer overflow in the BMP loader in imlib2 before 1.1.2 allows remote attackers to execute arbitrary code via a specially-crafted BMP image, a different vulnerability than CVE-2004-0817.

