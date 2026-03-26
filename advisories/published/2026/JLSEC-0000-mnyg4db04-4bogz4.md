```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4db04-4bogz4"
modified = 2026-03-26T21:18:55.732Z
upstream = ["CVE-2021-36368"]
references = ["https://bugzilla.mindrot.org/show_bug.cgi?id=3316", "https://docs.ssh-mitm.at/trivialauth.html", "https://github.com/openssh/openssh-portable/pull/258", "https://security-tracker.debian.org/tracker/CVE-2021-36368", "https://www.openssh.com/security.html", "https://bugzilla.mindrot.org/show_bug.cgi?id=3316", "https://docs.ssh-mitm.at/trivialauth.html", "https://github.com/openssh/openssh-portable/pull/258", "https://security-tracker.debian.org/tracker/CVE-2021-36368", "https://www.openssh.com/security.html"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2021-36368"
imported = 2026-03-26T21:18:55.732Z
modified = 2024-11-21T06:13:36.983Z
published = 2022-03-13T00:15:07.937Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-36368"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-36368"
```

# An issue was discovered in OpenSSH before 8.9

An issue was discovered in OpenSSH before 8.9. If a client is using public-key authentication with agent forwarding but without -oLogLevel=verbose, and an attacker has silently modified the server to support the None authentication option, then the user cannot determine whether FIDO authentication is going to confirm that the user wishes to connect to that server, or that the user wishes to allow that server to connect to a different server on the user's behalf. NOTE: the vendor's position is "this is not an authentication bypass, since nothing is being bypassed.

