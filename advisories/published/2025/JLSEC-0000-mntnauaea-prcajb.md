```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauaea-prcajb"
modified = 2025-11-25T22:35:57.346Z
upstream = ["CVE-2005-3582"]
references = ["http://secunia.com/advisories/17427/", "http://www.gentoo.org/security/en/glsa/glsa-200511-02.xml", "http://www.osvdb.org/20528", "http://www.securityfocus.com/bid/15120", "http://www.vupen.com/english/advisories/2005/2281", "http://secunia.com/advisories/17427/", "http://www.gentoo.org/security/en/glsa/glsa-200511-02.xml", "http://www.osvdb.org/20528", "http://www.securityfocus.com/bid/15120", "http://www.vupen.com/english/advisories/2005/2281"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2005-3582"
imported = 2025-11-25T22:35:57.346Z
modified = 2025-04-03T01:03:51.193Z
published = 2005-11-16T07:42:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2005-3582"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2005-3582"
```

# ImageMagick before 6.2.4.2-r1 allows local users in the portage group to increase privileges via a s...

ImageMagick before 6.2.4.2-r1 allows local users in the portage group to increase privileges via a shared object in the Portage temporary build directory, which is added to the search path allowing objects in it to be loaded at runtime.

