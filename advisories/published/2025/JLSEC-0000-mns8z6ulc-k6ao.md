```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6ulc-k6ao"
modified = 2025-10-21T17:21:19.200Z
upstream = ["CVE-2001-1147"]
references = ["http://www.ciac.org/ciac/bulletins/m-009.shtml", "http://www.iss.net/security_center/static/7266.php", "http://www.linux-mandrake.com/en/security/2001/MDKSA-2001-084.php3", "http://www.novell.com/linux/security/advisories/2001_034_shadow_txt.html", "http://www.redhat.com/support/errata/RHSA-2001-132.html", "http://www.securityfocus.com/archive/1/219175", "http://www.securityfocus.com/bid/3415", "http://www.ciac.org/ciac/bulletins/m-009.shtml", "http://www.iss.net/security_center/static/7266.php", "http://www.linux-mandrake.com/en/security/2001/MDKSA-2001-084.php3", "http://www.novell.com/linux/security/advisories/2001_034_shadow_txt.html", "http://www.redhat.com/support/errata/RHSA-2001-132.html", "http://www.securityfocus.com/archive/1/219175", "http://www.securityfocus.com/bid/3415"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2001-1147"
imported = 2025-10-21T17:21:19.171Z
modified = 2025-04-03T01:03:51.193Z
published = 2001-10-08T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2001-1147"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2001-1147"
```

# The PAM implementation in /bin/login of the util-linux package before 2.11 causes a password entry t...

The PAM implementation in /bin/login of the util-linux package before 2.11 causes a password entry to be rewritten across multiple PAM calls, which could provide the credentials of one user to a different user, when used in certain PAM modules such as pam_limits.

