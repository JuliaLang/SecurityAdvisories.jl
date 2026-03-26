```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4da9v-1dfqg3g"
modified = 2026-03-26T21:18:54.787Z
upstream = ["CVE-2011-4327"]
references = ["http://www.openssh.com/txt/portable-keysign-rand-helper.adv", "https://bugzilla.redhat.com/show_bug.cgi?id=755640", "http://www.openssh.com/txt/portable-keysign-rand-helper.adv", "https://bugzilla.redhat.com/show_bug.cgi?id=755640"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2011-4327"
imported = 2026-03-26T21:18:54.787Z
modified = 2025-04-11T00:51:21.963Z
published = 2014-02-03T03:55:03.550Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2011-4327"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2011-4327"
```

# ssh-keysign.c in ssh-keysign in OpenSSH before 5.8p2 on certain platforms executes ssh-rand-helper w...

ssh-keysign.c in ssh-keysign in OpenSSH before 5.8p2 on certain platforms executes ssh-rand-helper with unintended open file descriptors, which allows local users to obtain sensitive key information via the ptrace system call.

