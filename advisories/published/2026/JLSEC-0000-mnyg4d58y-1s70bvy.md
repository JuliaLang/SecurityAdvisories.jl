```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d58y-1s70bvy"
modified = 2026-03-26T21:18:48.274Z
upstream = ["CVE-2002-0083"]
references = ["ftp://ftp.freebsd.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:13.openssh.asc", "ftp://ftp.netbsd.org/pub/NetBSD/security/advisories/NetBSD-SA2002-004.txt.asc", "ftp://stage.caldera.com/pub/security/openserver/CSSA-2002-SCO.10/CSSA-2002-SCO.10.txt", "ftp://stage.caldera.com/pub/security/openunix/CSSA-2002-SCO.11/CSSA-2002-SCO.11.txt", "http://archives.neohapsis.com/archives/bugtraq/2002-03/0108.html", "http://archives.neohapsis.com/archives/vulnwatch/2002-q1/0060.html", "http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000467", "http://marc.info/?l=bugtraq&m=101552065005254&w=2", "http://marc.info/?l=bugtraq&m=101553908201861&w=2", "http://marc.info/?l=bugtraq&m=101561384821761&w=2", "http://marc.info/?l=bugtraq&m=101586991827622&w=2", "http://online.securityfocus.com/advisories/3960", "http://online.securityfocus.com/archive/1/264657", "http://www.calderasystems.com/support/security/advisories/CSSA-2002-012.0.txt", "http://www.debian.org/security/2002/dsa-119", "http://www.iss.net/security_center/static/8383.php", "http://www.linux-mandrake.com/en/security/2002/MDKSA-2002-019.php", "http://www.linuxsecurity.com/advisories/other_advisory-1937.html", "http://www.novell.com/linux/security/advisories/2002_009_openssh_txt.html", "http://www.openbsd.org/advisories/ssh_channelalloc.txt", "http://www.osvdb.org/730", "http://www.redhat.com/support/errata/RHSA-2002-043.html", "http://www.securityfocus.com/bid/4241", "ftp://ftp.freebsd.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:13.openssh.asc", "ftp://ftp.netbsd.org/pub/NetBSD/security/advisories/NetBSD-SA2002-004.txt.asc", "ftp://stage.caldera.com/pub/security/openserver/CSSA-2002-SCO.10/CSSA-2002-SCO.10.txt", "ftp://stage.caldera.com/pub/security/openunix/CSSA-2002-SCO.11/CSSA-2002-SCO.11.txt", "http://archives.neohapsis.com/archives/bugtraq/2002-03/0108.html", "http://archives.neohapsis.com/archives/vulnwatch/2002-q1/0060.html", "http://distro.conectiva.com.br/atualizacoes/?id=a&anuncio=000467", "http://marc.info/?l=bugtraq&m=101552065005254&w=2", "http://marc.info/?l=bugtraq&m=101553908201861&w=2", "http://marc.info/?l=bugtraq&m=101561384821761&w=2", "http://marc.info/?l=bugtraq&m=101586991827622&w=2", "http://online.securityfocus.com/advisories/3960", "http://online.securityfocus.com/archive/1/264657", "http://www.calderasystems.com/support/security/advisories/CSSA-2002-012.0.txt", "http://www.debian.org/security/2002/dsa-119", "http://www.iss.net/security_center/static/8383.php", "http://www.linux-mandrake.com/en/security/2002/MDKSA-2002-019.php", "http://www.linuxsecurity.com/advisories/other_advisory-1937.html", "http://www.novell.com/linux/security/advisories/2002_009_openssh_txt.html", "http://www.openbsd.org/advisories/ssh_channelalloc.txt", "http://www.osvdb.org/730", "http://www.redhat.com/support/errata/RHSA-2002-043.html", "http://www.securityfocus.com/bid/4241"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = [">= 9.2.0+0, < 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2002-0083"
imported = 2026-03-26T21:18:48.274Z
modified = 2025-04-03T01:03:51.193Z
published = 2002-03-15T05:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2002-0083"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2002-0083"
```

# Off-by-one error in the channel code of OpenSSH 2.0 through 3.0.2 allows local users or remote malic...

Off-by-one error in the channel code of OpenSSH 2.0 through 3.0.2 allows local users or remote malicious servers to gain privileges.

