```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6uli-13eyna2"
modified = 2025-10-21T17:21:19.206Z
upstream = ["CVE-2003-0094"]
references = ["http://www.mandrakesoft.com/security/advisories?name=MDKSA-2003:016", "http://www.securityfocus.com/bid/6855", "https://exchange.xforce.ibmcloud.com/vulnerabilities/11318", "http://www.mandrakesoft.com/security/advisories?name=MDKSA-2003:016", "http://www.securityfocus.com/bid/6855", "https://exchange.xforce.ibmcloud.com/vulnerabilities/11318"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2003-0094"
imported = 2025-10-21T17:21:19.206Z
modified = 2025-04-03T01:03:51.193Z
published = 2003-03-03T05:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2003-0094"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2003-0094"
```

# A patch for mcookie in the util-linux package for Mandrake Linux 8.2 and 9.0 uses /dev/urandom inste...

A patch for mcookie in the util-linux package for Mandrake Linux 8.2 and 9.0 uses /dev/urandom instead of /dev/random, which causes mcookie to use an entropy source that is more predictable than expected, which may make it easier for certain types of attacks to succeed.

