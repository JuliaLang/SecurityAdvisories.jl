```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d56p-1gm37x1"
modified = 2026-03-26T21:18:48.193Z
upstream = ["CVE-2001-1382"]
references = ["http://www.openwall.com/Owl/CHANGES-stable.shtml", "http://www.osvdb.org/5408", "http://www.openwall.com/Owl/CHANGES-stable.shtml", "http://www.osvdb.org/5408"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.2.0+0"]

[[jlsec_sources]]
id = "CVE-2001-1382"
imported = 2026-03-26T21:18:48.193Z
modified = 2025-04-03T01:03:51.193Z
published = 2001-09-27T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2001-1382"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2001-1382"
```

# The "echo simulation" traffic analysis countermeasure in OpenSSH before 2.9.9p2 sends an additional ...

The "echo simulation" traffic analysis countermeasure in OpenSSH before 2.9.9p2 sends an additional echo packet after the password and carriage return is entered, which could allow remote attackers to determine that the countermeasure is being used.

