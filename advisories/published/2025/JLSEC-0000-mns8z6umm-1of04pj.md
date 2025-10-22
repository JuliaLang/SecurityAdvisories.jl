```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6umm-1of04pj"
modified = 2025-10-21T17:21:19.246Z
upstream = ["CVE-2013-0157"]
references = ["http://bugs.debian.org/697464", "http://marc.info/?l=oss-security&m=135749410312247&w=2", "http://osvdb.org/88953", "http://rhn.redhat.com/errata/RHSA-2013-0517.html", "http://www.mandriva.com/security/advisories?name=MDVSA-2013:154", "https://bugzilla.redhat.com/show_bug.cgi?id=892330", "http://bugs.debian.org/697464", "http://marc.info/?l=oss-security&m=135749410312247&w=2", "http://osvdb.org/88953", "http://rhn.redhat.com/errata/RHSA-2013-0517.html", "http://www.mandriva.com/security/advisories?name=MDVSA-2013:154", "https://bugzilla.redhat.com/show_bug.cgi?id=892330"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2013-0157"
imported = 2025-10-21T17:21:19.246Z
modified = 2025-04-11T00:51:21.963Z
published = 2014-01-21T18:55:09.007Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2013-0157"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2013-0157"
```

# (a) mount and (b) umount in util-linux 2.14.1, 2.17.2, and probably other versions allow local users...

(a) mount and (b) umount in util-linux 2.14.1, 2.17.2, and probably other versions allow local users to determine the existence of restricted directories by (1) using the --guess-fstype command-line option or (2) attempting to mount a non-existent device, which generates different error messages depending on whether the directory exists.

