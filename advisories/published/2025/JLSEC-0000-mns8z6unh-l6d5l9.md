```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6unh-l6d5l9"
modified = 2025-10-21T17:21:19.277Z
upstream = ["CVE-2016-5011"]
references = ["http://rhn.redhat.com/errata/RHSA-2016-2605.html", "http://www-01.ibm.com/support/docview.wss?uid=isg3T1024543", "http://www-01.ibm.com/support/docview.wss?uid=nas8N1021801", "http://www.openwall.com/lists/oss-security/2016/07/11/2", "http://www.securityfocus.com/bid/91683", "http://www.securitytracker.com/id/1036272", "https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=7164a1c3", "http://rhn.redhat.com/errata/RHSA-2016-2605.html", "http://www-01.ibm.com/support/docview.wss?uid=isg3T1024543", "http://www-01.ibm.com/support/docview.wss?uid=nas8N1021801", "http://www.openwall.com/lists/oss-security/2016/07/11/2", "http://www.securityfocus.com/bid/91683", "http://www.securitytracker.com/id/1036272", "https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=7164a1c3"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2016-5011"
imported = 2025-10-21T17:21:19.277Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-11T15:59:00.183Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-5011"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-5011"
```

# The parse_dos_extended function in partitions/dos.c in the libblkid library in util-linux allows phy...

The parse_dos_extended function in partitions/dos.c in the libblkid library in util-linux allows physically proximate attackers to cause a denial of service (memory consumption) via a crafted MSDOS partition table with an extended partition boot record at zero offset.

