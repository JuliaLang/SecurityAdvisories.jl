```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6umk-nec7h3"
modified = 2025-10-21T17:21:19.244Z
upstream = ["CVE-2001-1494"]
references = ["http://seclists.org/bugtraq/2001/Dec/0122.html", "http://seclists.org/bugtraq/2001/Dec/0123.html", "http://secunia.com/advisories/16785", "http://secunia.com/advisories/18502", "http://support.avaya.com/elmodocs2/security/ASA-2006-014.htm", "http://www.redhat.com/support/errata/RHSA-2005-782.html", "http://www.securityfocus.com/bid/16280", "https://exchange.xforce.ibmcloud.com/vulnerabilities/7718", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10723", "http://seclists.org/bugtraq/2001/Dec/0122.html", "http://seclists.org/bugtraq/2001/Dec/0123.html", "http://secunia.com/advisories/16785", "http://secunia.com/advisories/18502", "http://support.avaya.com/elmodocs2/security/ASA-2006-014.htm", "http://www.redhat.com/support/errata/RHSA-2005-782.html", "http://www.securityfocus.com/bid/16280", "https://exchange.xforce.ibmcloud.com/vulnerabilities/7718", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10723"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2001-1494"
imported = 2025-10-21T17:21:19.244Z
modified = 2025-04-03T01:03:51.193Z
published = 2001-12-31T05:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2001-1494"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2001-1494"
```

# script command in the util-linux package before 2.11n allows local users to overwrite arbitrary file...

script command in the util-linux package before 2.11n allows local users to overwrite arbitrary files by setting a hardlink from the typescript log file to any file on the system, then having root execute the script command.

