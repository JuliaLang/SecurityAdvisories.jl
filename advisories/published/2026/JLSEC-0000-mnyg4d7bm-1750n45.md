```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d7bm-1750n45"
modified = 2026-03-26T21:18:50.962Z
upstream = ["CVE-2007-2768"]
references = ["http://archives.neohapsis.com/archives/fulldisclosure/2007-04/0635.html", "http://www.osvdb.org/34601", "https://security.netapp.com/advisory/ntap-20191107-0002/", "http://archives.neohapsis.com/archives/fulldisclosure/2007-04/0635.html", "http://www.osvdb.org/34601", "https://security.netapp.com/advisory/ntap-20191107-0002/"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2007-2768"
imported = 2026-03-26T21:18:50.962Z
modified = 2025-04-09T00:30:58.490Z
published = 2007-05-21T20:30:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2007-2768"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2007-2768"
```

# OpenSSH, when using OPIE (One-Time Passwords in Everything) for PAM, allows remote attackers to dete...

OpenSSH, when using OPIE (One-Time Passwords in Everything) for PAM, allows remote attackers to determine the existence of certain user accounts, which displays a different response if the user account exists and is configured to use one-time passwords (OTP), a similar issue to CVE-2007-2243.

