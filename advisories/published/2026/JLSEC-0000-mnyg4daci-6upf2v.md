```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4daci-6upf2v"
modified = 2026-03-26T21:18:54.882Z
upstream = ["CVE-2015-5352"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2015-09/msg00017.html", "http://openwall.com/lists/oss-security/2015/07/01/10", "http://rhn.redhat.com/errata/RHSA-2016-0741.html", "http://www.openssh.com/txt/release-6.9", "http://www.oracle.com/technetwork/topics/security/bulletinjan2016-2867206.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/bid/75525", "http://www.securitytracker.com/id/1032797", "http://www.ubuntu.com/usn/USN-2710-1", "http://www.ubuntu.com/usn/USN-2710-2", "https://anongit.mindrot.org/openssh.git/commit/?h=V_6_9&id=1bf477d3cdf1a864646d59820878783d42357a1d", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.gentoo.org/glsa/201512-04", "https://security.netapp.com/advisory/ntap-20181023-0001/", "http://lists.opensuse.org/opensuse-security-announce/2015-09/msg00017.html", "http://openwall.com/lists/oss-security/2015/07/01/10", "http://rhn.redhat.com/errata/RHSA-2016-0741.html", "http://www.openssh.com/txt/release-6.9", "http://www.oracle.com/technetwork/topics/security/bulletinjan2016-2867206.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/bid/75525", "http://www.securitytracker.com/id/1032797", "http://www.ubuntu.com/usn/USN-2710-1", "http://www.ubuntu.com/usn/USN-2710-2", "https://anongit.mindrot.org/openssh.git/commit/?h=V_6_9&id=1bf477d3cdf1a864646d59820878783d42357a1d", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.gentoo.org/glsa/201512-04", "https://security.netapp.com/advisory/ntap-20181023-0001/"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2015-5352"
imported = 2026-03-26T21:18:54.882Z
modified = 2025-04-12T10:46:40.837Z
published = 2015-08-03T01:59:01.137Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-5352"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-5352"
```

# The x11_open_helper function in channels.c in ssh in OpenSSH before 6.9, when ForwardX11Trusted mode...

The x11_open_helper function in channels.c in ssh in OpenSSH before 6.9, when ForwardX11Trusted mode is not used, lacks a check of the refusal deadline for X connections, which makes it easier for remote attackers to bypass intended access restrictions via a connection outside of the permitted time window.

