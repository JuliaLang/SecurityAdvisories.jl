```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4dazr-1k0kdnu"
modified = 2026-03-26T21:18:55.719Z
upstream = ["CVE-2016-20012"]
references = ["https://github.com/openssh/openssh-portable/blob/d0fffc88c8fe90c1815c6f4097bc8cbcabc0f3dd/auth2-pubkey.c#L261-L265", "https://github.com/openssh/openssh-portable/pull/270", "https://github.com/openssh/openssh-portable/pull/270#issuecomment-920577097", "https://github.com/openssh/openssh-portable/pull/270#issuecomment-943909185", "https://rushter.com/blog/public-ssh-keys/", "https://security.netapp.com/advisory/ntap-20211014-0005/", "https://utcc.utoronto.ca/~cks/space/blog/tech/SSHKeysAreInfoLeak", "https://www.openwall.com/lists/oss-security/2018/08/24/1", "https://github.com/openssh/openssh-portable/blob/d0fffc88c8fe90c1815c6f4097bc8cbcabc0f3dd/auth2-pubkey.c#L261-L265", "https://github.com/openssh/openssh-portable/pull/270", "https://github.com/openssh/openssh-portable/pull/270#issuecomment-920577097", "https://github.com/openssh/openssh-portable/pull/270#issuecomment-943909185", "https://rushter.com/blog/public-ssh-keys/", "https://security.netapp.com/advisory/ntap-20211014-0005/", "https://utcc.utoronto.ca/~cks/space/blog/tech/SSHKeysAreInfoLeak", "https://www.openwall.com/lists/oss-security/2018/08/24/1"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2016-20012"
imported = 2026-03-26T21:18:55.719Z
modified = 2024-11-21T02:47:33.240Z
published = 2021-09-15T20:15:07.310Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-20012"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-20012"
```

# OpenSSH through 8.7 allows remote attackers, who have a suspicion that a certain combination of user...

OpenSSH through 8.7 allows remote attackers, who have a suspicion that a certain combination of username and public key is known to an SSH server, to test whether this suspicion is correct. This occurs because a challenge is sent only when that combination could be valid for a login session. NOTE: the vendor does not recognize user enumeration as a vulnerability for this product

