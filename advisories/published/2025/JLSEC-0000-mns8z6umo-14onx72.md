```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6umo-14onx72"
modified = 2025-10-21T17:21:19.248Z
upstream = ["CVE-2016-2779"]
references = ["http://www.openwall.com/lists/oss-security/2016/02/27/1", "http://www.openwall.com/lists/oss-security/2016/02/27/2", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=815922", "http://www.openwall.com/lists/oss-security/2016/02/27/1", "http://www.openwall.com/lists/oss-security/2016/02/27/2", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=815922"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2016-2779"
imported = 2025-10-21T17:21:19.248Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-02-07T15:59:00.287Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-2779"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-2779"
```

# runuser in util-linux allows local users to escape to the parent session via a crafted TIOCSTI ioctl...

runuser in util-linux allows local users to escape to the parent session via a crafted TIOCSTI ioctl call, which pushes characters to the terminal's input buffer.

