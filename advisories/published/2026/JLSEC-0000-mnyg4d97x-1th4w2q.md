```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d97x-1th4w2q"
modified = 2026-03-26T21:18:53.421Z
upstream = ["CVE-2012-0814"]
references = ["http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=657445", "http://kb.juniper.net/InfoCenter/index?page=content&id=JSA10673", "http://openwall.com/lists/oss-security/2012/01/26/15", "http://openwall.com/lists/oss-security/2012/01/26/16", "http://openwall.com/lists/oss-security/2012/01/27/1", "http://openwall.com/lists/oss-security/2012/01/27/4", "http://osvdb.org/78706", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/auth-options.c", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/auth-options.c.diff?r1=1.53%3Br2=1.54", "http://www.securityfocus.com/bid/51702", "https://exchange.xforce.ibmcloud.com/vulnerabilities/72756", "http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=657445", "http://kb.juniper.net/InfoCenter/index?page=content&id=JSA10673", "http://openwall.com/lists/oss-security/2012/01/26/15", "http://openwall.com/lists/oss-security/2012/01/26/16", "http://openwall.com/lists/oss-security/2012/01/27/1", "http://openwall.com/lists/oss-security/2012/01/27/4", "http://osvdb.org/78706", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/auth-options.c", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/auth-options.c.diff?r1=1.53%3Br2=1.54", "http://www.securityfocus.com/bid/51702", "https://exchange.xforce.ibmcloud.com/vulnerabilities/72756"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2012-0814"
imported = 2026-03-26T21:18:53.421Z
modified = 2025-04-11T00:51:21.963Z
published = 2012-01-27T19:55:01.063Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2012-0814"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2012-0814"
```

# The auth_parse_options function in auth-options.c in sshd in OpenSSH before 5.7 provides debug messa...

The auth_parse_options function in auth-options.c in sshd in OpenSSH before 5.7 provides debug messages containing authorized_keys command options, which allows remote authenticated users to obtain potentially sensitive information by reading these messages, as demonstrated by the shared user account required by Gitolite.  NOTE: this can cross privilege boundaries because a user account may intentionally have no shell or filesystem access, and therefore may have no supported way to read an authorized_keys file in its own home directory.

