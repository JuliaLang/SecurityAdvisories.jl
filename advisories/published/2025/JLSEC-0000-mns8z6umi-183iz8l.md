```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6umi-183iz8l"
modified = 2025-10-21T17:21:19.242Z
upstream = ["CVE-2005-2876"]
references = ["http://marc.info/?l=bugtraq&m=112656096125857&w=2", "http://marc.info/?l=bugtraq&m=112690609622266&w=2", "http://secunia.com/advisories/16785", "http://secunia.com/advisories/16988", "http://secunia.com/advisories/17004", "http://secunia.com/advisories/17027", "http://secunia.com/advisories/17133", "http://secunia.com/advisories/17154", "http://secunia.com/advisories/18502", "http://sunsolve.sun.com/search/document.do?assetkey=1-26-101960-1", "http://support.avaya.com/elmodocs2/security/ASA-2006-014.htm", "http://www.debian.org/security/2005/dsa-823", "http://www.debian.org/security/2005/dsa-825", "http://www.novell.com/linux/security/advisories/2005_21_sr.html", "http://www.osvdb.org/19369", "http://www.securityfocus.com/archive/1/419774/100/0/threaded", "http://www.securityfocus.com/bid/14816", "http://www.ubuntu.com/usn/usn-184-1", "https://exchange.xforce.ibmcloud.com/vulnerabilities/22241", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10921", "http://marc.info/?l=bugtraq&m=112656096125857&w=2", "http://marc.info/?l=bugtraq&m=112690609622266&w=2", "http://secunia.com/advisories/16785", "http://secunia.com/advisories/16988", "http://secunia.com/advisories/17004", "http://secunia.com/advisories/17027", "http://secunia.com/advisories/17133", "http://secunia.com/advisories/17154", "http://secunia.com/advisories/18502", "http://sunsolve.sun.com/search/document.do?assetkey=1-26-101960-1", "http://support.avaya.com/elmodocs2/security/ASA-2006-014.htm", "http://www.debian.org/security/2005/dsa-823", "http://www.debian.org/security/2005/dsa-825", "http://www.novell.com/linux/security/advisories/2005_21_sr.html", "http://www.osvdb.org/19369", "http://www.securityfocus.com/archive/1/419774/100/0/threaded", "http://www.securityfocus.com/bid/14816", "http://www.ubuntu.com/usn/usn-184-1", "https://exchange.xforce.ibmcloud.com/vulnerabilities/22241", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10921"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2005-2876"
imported = 2025-10-21T17:21:19.242Z
modified = 2025-04-03T01:03:51.193Z
published = 2005-09-13T23:03:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2005-2876"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2005-2876"
```

# umount in util-linux 2.8 to 2.12q, 2.13-pre1, and 2.13-pre2, and other packages such as loop-aes-uti...

umount in util-linux 2.8 to 2.12q, 2.13-pre1, and 2.13-pre2, and other packages such as loop-aes-utils, allows local users with unmount permissions to gain privileges via the -r (remount) option, which causes the file system to be remounted with just the read-only flag, which effectively clears the nosuid, nodev, and other flags.

