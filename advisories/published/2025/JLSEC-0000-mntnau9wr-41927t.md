```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnau9wr-41927t"
modified = 2025-11-25T22:35:56.715Z
upstream = ["CVE-2003-0555"]
references = ["http://marc.info/?l=bugtraq&m=105820576111599&w=2", "http://marc.info/?l=bugtraq&m=105820576111599&w=2"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2003-0555"
imported = 2025-11-25T22:35:56.688Z
modified = 2025-04-03T01:03:51.193Z
published = 2003-08-18T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2003-0555"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2003-0555"
```

# ImageMagick 5.4.3.x and earlier allows attackers to cause a denial of service (crash) and possibly e...

ImageMagick 5.4.3.x and earlier allows attackers to cause a denial of service (crash) and possibly execute arbitrary code via a "%x" filename, possibly triggering a format string vulnerability.

