```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4db50-1a3qn59"
modified = 2026-03-26T21:19:09.335Z
upstream = ["EUVD-2025-10504", "CVE-2025-32728", "GHSA-26mg-p594-q328"]
severity = ["CVSS:3.1/AV:L/AC:L/PR:N/UI:N/S:C/C:N/I:L/A:N"]
references = ["https://nvd.nist.gov/vuln/detail/CVE-2025-32728", "https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367", "https://ftp.openbsd.org/pub/OpenBSD/patches/7.6/common/013_ssh.patch.sig", "https://lists.mindrot.org/pipermail/openssh-unix-dev/2025-April/041879.html", "https://www.openssh.com/txt/release-10.0", "https://www.openssh.com/txt/release-7.4", "https://security.netapp.com/advisory/ntap-20250425-0002", "https://lists.debian.org/debian-lts-announce/2025/05/msg00008.html", "https://security.netapp.com/advisory/ntap-20250425-0002/"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = [">= 9.3.2+0, < 10.0.1+0"]

[[jlsec_sources]]
id = "EUVD-2025-10504"
imported = 2026-03-26T21:18:57.114Z
modified = 2025-05-08T13:11:19.000Z
published = 2025-04-10T00:00:00.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-10504"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-10504"
[[jlsec_sources]]
id = "CVE-2025-32728"
imported = 2026-03-26T21:19:09.335Z
modified = 2025-05-22T16:51:54.890Z
published = 2025-04-10T02:15:30.873Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-32728"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-32728"
```

# In sshd in OpenSSH before 10.0, the DisableForwarding directive does not adhere to the documentation...

In sshd in OpenSSH before 10.0, the DisableForwarding directive does not adhere to the documentation stating that it disables X11 and agent forwarding.

