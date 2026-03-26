```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d8v5-1l8c4vo"
modified = 2026-03-26T21:18:52.961Z
upstream = ["CVE-2010-4755"]
references = ["http://cvsweb.netbsd.org/cgi-bin/cvsweb.cgi/src/crypto/dist/ssh/Attic/sftp-glob.c#rev1.13.12.1", "http://cvsweb.netbsd.org/cgi-bin/cvsweb.cgi/src/crypto/dist/ssh/Attic/sftp.c#rev1.21.6.1", "http://cxib.net/stuff/glob-0day.c", "http://ftp.netbsd.org/pub/NetBSD/security/advisories/NetBSD-SA2010-008.txt.asc", "http://securityreason.com/achievement_securityalert/89", "http://securityreason.com/exploitalert/9223", "http://securityreason.com/securityalert/8116", "http://cvsweb.netbsd.org/cgi-bin/cvsweb.cgi/src/crypto/dist/ssh/Attic/sftp-glob.c#rev1.13.12.1", "http://cvsweb.netbsd.org/cgi-bin/cvsweb.cgi/src/crypto/dist/ssh/Attic/sftp.c#rev1.21.6.1", "http://cxib.net/stuff/glob-0day.c", "http://ftp.netbsd.org/pub/NetBSD/security/advisories/NetBSD-SA2010-008.txt.asc", "http://securityreason.com/achievement_securityalert/89", "http://securityreason.com/exploitalert/9223", "http://securityreason.com/securityalert/8116"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2010-4755"
imported = 2026-03-26T21:18:52.961Z
modified = 2025-04-11T00:51:21.963Z
published = 2011-03-02T20:00:00.990Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2010-4755"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2010-4755"
```

# The (1) remote_glob function in sftp-glob.c and the (2) process_put function in sftp.c in OpenSSH 5....

The (1) remote_glob function in sftp-glob.c and the (2) process_put function in sftp.c in OpenSSH 5.8 and earlier, as used in FreeBSD 7.3 and 8.1, NetBSD 5.0.2, OpenBSD 4.7, and other products, allow remote authenticated users to cause a denial of service (CPU and memory consumption) via crafted glob expressions that do not match any pathnames, as demonstrated by glob expressions in SSH_FXP_STAT requests to an sftp daemon, a different vulnerability than CVE-2010-2632.

