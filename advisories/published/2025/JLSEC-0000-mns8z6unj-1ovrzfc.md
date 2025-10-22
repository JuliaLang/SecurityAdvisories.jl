```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6unj-1ovrzfc"
modified = 2025-10-21T17:21:19.279Z
upstream = ["CVE-2015-5224"]
references = ["http://www.openwall.com/lists/oss-security/2015/08/24/3", "http://www.securityfocus.com/bid/76467", "https://bugzilla.redhat.com/show_bug.cgi?id=1256686", "https://github.com/karelzak/util-linux/commit/bde91c85bdc77975155058276f99d2e0f5eab5a9", "http://www.openwall.com/lists/oss-security/2015/08/24/3", "http://www.securityfocus.com/bid/76467", "https://bugzilla.redhat.com/show_bug.cgi?id=1256686", "https://github.com/karelzak/util-linux/commit/bde91c85bdc77975155058276f99d2e0f5eab5a9"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2015-5224"
imported = 2025-10-21T17:21:19.279Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-23T15:29:00.207Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-5224"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-5224"
```

# The mkostemp function in login-utils in util-linux when used incorrectly allows remote attackers to ...

The mkostemp function in login-utils in util-linux when used incorrectly allows remote attackers to cause file name collision and possibly other attacks.

