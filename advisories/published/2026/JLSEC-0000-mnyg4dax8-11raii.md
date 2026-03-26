```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4dax8-11raii"
modified = 2026-03-26T21:18:55.628Z
upstream = ["CVE-2019-6109"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2019-06/msg00058.html", "https://access.redhat.com/errata/RHSA-2019:3702", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://cvsweb.openbsd.org/src/usr.bin/ssh/progressmeter.c", "https://cvsweb.openbsd.org/src/usr.bin/ssh/scp.c", "https://lists.debian.org/debian-lts-announce/2019/03/msg00030.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/W3YVQ2BPTOVDCFDVNC2GGF5P5ISFG37G/", "https://security.gentoo.org/glsa/201903-16", "https://security.netapp.com/advisory/ntap-20190213-0001/", "https://sintonen.fi/advisories/scp-client-multiple-vulnerabilities.txt", "https://usn.ubuntu.com/3885-1/", "https://www.debian.org/security/2019/dsa-4387", "https://www.oracle.com/technetwork/security-advisory/cpuoct2019-5072832.html", "http://lists.opensuse.org/opensuse-security-announce/2019-06/msg00058.html", "https://access.redhat.com/errata/RHSA-2019:3702", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://cvsweb.openbsd.org/src/usr.bin/ssh/progressmeter.c", "https://cvsweb.openbsd.org/src/usr.bin/ssh/scp.c", "https://lists.debian.org/debian-lts-announce/2019/03/msg00030.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/W3YVQ2BPTOVDCFDVNC2GGF5P5ISFG37G/", "https://security.gentoo.org/glsa/201903-16", "https://security.netapp.com/advisory/ntap-20190213-0001/", "https://sintonen.fi/advisories/scp-client-multiple-vulnerabilities.txt", "https://usn.ubuntu.com/3885-1/", "https://www.debian.org/security/2019/dsa-4387", "https://www.oracle.com/technetwork/security-advisory/cpuoct2019-5072832.html"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2019-6109"
imported = 2026-03-26T21:18:55.628Z
modified = 2024-11-21T04:45:57.517Z
published = 2019-01-31T18:29:00.710Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-6109"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-6109"
```

# An issue was discovered in OpenSSH 7.9

An issue was discovered in OpenSSH 7.9. Due to missing character encoding in the progress display, a malicious server (or Man-in-The-Middle attacker) can employ crafted object names to manipulate the client output, e.g., by using ANSI control codes to hide additional files being transferred. This affects refresh_progress_meter() in progressmeter.c.

