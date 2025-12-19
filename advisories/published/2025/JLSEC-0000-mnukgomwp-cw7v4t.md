```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnukgomwp-cw7v4t"
modified = 2025-12-19T03:35:55.129Z
upstream = ["CVE-2023-51385"]
references = ["http://seclists.org/fulldisclosure/2024/Mar/21", "http://www.openwall.com/lists/oss-security/2023/12/26/4", "https://github.com/openssh/openssh-portable/commit/7ef3787c84b6b524501211b11a26c742f829af1a", "https://lists.debian.org/debian-lts-announce/2023/12/msg00017.html", "https://security.gentoo.org/glsa/202312-17", "https://security.netapp.com/advisory/ntap-20240105-0005/", "https://support.apple.com/kb/HT214084", "https://vin01.github.io/piptagole/ssh/security/openssh/libssh/remote-code-execution/2023/12/20/openssh-proxycommand-libssh-rce.html", "https://www.debian.org/security/2023/dsa-5586", "https://www.openssh.com/txt/release-9.6", "https://www.openwall.com/lists/oss-security/2023/12/18/2", "http://seclists.org/fulldisclosure/2024/Mar/21", "http://www.openwall.com/lists/oss-security/2023/12/26/4", "http://www.openwall.com/lists/oss-security/2025/10/07/1", "http://www.openwall.com/lists/oss-security/2025/10/12/1", "https://github.com/openssh/openssh-portable/commit/7ef3787c84b6b524501211b11a26c742f829af1a", "https://lists.debian.org/debian-lts-announce/2023/12/msg00017.html", "https://security.gentoo.org/glsa/202312-17", "https://security.netapp.com/advisory/ntap-20240105-0005/", "https://support.apple.com/kb/HT214084", "https://vin01.github.io/piptagole/ssh/security/openssh/libssh/remote-code-execution/2023/12/20/openssh-proxycommand-libssh-rce.html", "https://www.debian.org/security/2023/dsa-5586", "https://www.openssh.com/txt/release-9.6", "https://www.openwall.com/lists/oss-security/2023/12/18/2"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.9.1+0"]

[[jlsec_sources]]
id = "CVE-2023-51385"
imported = 2025-12-19T03:35:55.129Z
modified = 2025-12-18T15:15:49.263Z
published = 2023-12-18T19:15:08.773Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-51385"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-51385"
```

# In ssh in OpenSSH before 9.6, OS command injection might occur if a user name or host name has shell...

In ssh in OpenSSH before 9.6, OS command injection might occur if a user name or host name has shell metacharacters, and this name is referenced by an expansion token in certain situations. For example, an untrusted Git repository can have a submodule with shell metacharacters in a user name or host name.

