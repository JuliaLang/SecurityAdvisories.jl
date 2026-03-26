```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d9wn-1q20ksa"
modified = 2026-03-26T21:18:54.311Z
upstream = ["CVE-2014-1692"]
references = ["http://marc.info/?l=bugtraq&m=141576985122836&w=2", "http://marc.info/?l=bugtraq&m=144050155601375&w=2", "http://openwall.com/lists/oss-security/2014/01/29/10", "http://openwall.com/lists/oss-security/2014/01/29/2", "http://osvdb.org/102611", "http://secunia.com/advisories/60184", "http://www-01.ibm.com/support/docview.wss?uid=isg3T1020637", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/Attic/schnorr.c.diff?r1=1.9%3Br2=1.10%3Bf=h", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/schnorr.c#rev1.10", "http://www.securityfocus.com/bid/65230", "https://exchange.xforce.ibmcloud.com/vulnerabilities/90819", "http://marc.info/?l=bugtraq&m=141576985122836&w=2", "http://marc.info/?l=bugtraq&m=144050155601375&w=2", "http://openwall.com/lists/oss-security/2014/01/29/10", "http://openwall.com/lists/oss-security/2014/01/29/2", "http://osvdb.org/102611", "http://secunia.com/advisories/60184", "http://www-01.ibm.com/support/docview.wss?uid=isg3T1020637", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/Attic/schnorr.c.diff?r1=1.9%3Br2=1.10%3Bf=h", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/schnorr.c#rev1.10", "http://www.securityfocus.com/bid/65230", "https://exchange.xforce.ibmcloud.com/vulnerabilities/90819"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2014-1692"
imported = 2026-03-26T21:18:54.311Z
modified = 2025-04-11T00:51:21.963Z
published = 2014-01-29T16:02:05.443Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-1692"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-1692"
```

# The hash_buffer function in schnorr.c in OpenSSH through 6.4, when Makefile.inc is modified to enabl...

The hash_buffer function in schnorr.c in OpenSSH through 6.4, when Makefile.inc is modified to enable the J-PAKE protocol, does not initialize certain data structures, which might allow remote attackers to cause a denial of service (memory corruption) or have unspecified other impact via vectors that trigger an error condition.

