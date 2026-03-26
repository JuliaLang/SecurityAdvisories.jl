```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d6tx-1s9ce10"
modified = 2026-03-26T21:18:50.325Z
upstream = ["CVE-2006-5794"]
references = ["ftp://patches.sgi.com/support/free/security/advisories/20061201-01-P.asc", "http://rhn.redhat.com/errata/RHSA-2006-0738.html", "http://secunia.com/advisories/22771", "http://secunia.com/advisories/22772", "http://secunia.com/advisories/22773", "http://secunia.com/advisories/22778", "http://secunia.com/advisories/22814", "http://secunia.com/advisories/22872", "http://secunia.com/advisories/22932", "http://secunia.com/advisories/23513", "http://secunia.com/advisories/23680", "http://secunia.com/advisories/24055", "http://securitytracker.com/id?1017183", "http://sourceforge.net/project/shownotes.php?release_id=461854&group_id=69227", "http://sourceforge.net/project/shownotes.php?release_id=461863&group_id=69227", "http://support.avaya.com/elmodocs2/security/ASA-2007-048.htm", "http://www.mandriva.com/security/advisories?name=MDKSA-2006:204", "http://www.novell.com/linux/security/advisories/2006_26_sr.html", "http://www.openpkg.org/security/advisories/OpenPKG-SA-2006.032-openssh.html", "http://www.openssh.org/txt/release-4.5", "http://www.securityfocus.com/archive/1/451100/100/0/threaded", "http://www.securityfocus.com/bid/20956", "http://www.vmware.com/support/vi3/doc/esx-3069097-patch.html", "http://www.vmware.com/support/vi3/doc/esx-9986131-patch.html", "http://www.vupen.com/english/advisories/2006/4399", "http://www.vupen.com/english/advisories/2006/4400", "https://exchange.xforce.ibmcloud.com/vulnerabilities/30120", "https://issues.rpath.com/browse/RPL-766", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A11840", "ftp://patches.sgi.com/support/free/security/advisories/20061201-01-P.asc", "http://rhn.redhat.com/errata/RHSA-2006-0738.html", "http://secunia.com/advisories/22771", "http://secunia.com/advisories/22772", "http://secunia.com/advisories/22773", "http://secunia.com/advisories/22778", "http://secunia.com/advisories/22814", "http://secunia.com/advisories/22872", "http://secunia.com/advisories/22932", "http://secunia.com/advisories/23513", "http://secunia.com/advisories/23680", "http://secunia.com/advisories/24055", "http://securitytracker.com/id?1017183", "http://sourceforge.net/project/shownotes.php?release_id=461854&group_id=69227", "http://sourceforge.net/project/shownotes.php?release_id=461863&group_id=69227", "http://support.avaya.com/elmodocs2/security/ASA-2007-048.htm", "http://www.mandriva.com/security/advisories?name=MDKSA-2006:204", "http://www.novell.com/linux/security/advisories/2006_26_sr.html", "http://www.openpkg.org/security/advisories/OpenPKG-SA-2006.032-openssh.html", "http://www.openssh.org/txt/release-4.5", "http://www.securityfocus.com/archive/1/451100/100/0/threaded", "http://www.securityfocus.com/bid/20956", "http://www.vmware.com/support/vi3/doc/esx-3069097-patch.html", "http://www.vmware.com/support/vi3/doc/esx-9986131-patch.html", "http://www.vupen.com/english/advisories/2006/4399", "http://www.vupen.com/english/advisories/2006/4400", "https://exchange.xforce.ibmcloud.com/vulnerabilities/30120", "https://issues.rpath.com/browse/RPL-766", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A11840"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2006-5794"
imported = 2026-03-26T21:18:50.325Z
modified = 2025-04-09T00:30:58.490Z
published = 2006-11-08T20:07:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2006-5794"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2006-5794"
```

# Unspecified vulnerability in the sshd Privilege Separation Monitor in OpenSSH before 4.5 causes weak...

Unspecified vulnerability in the sshd Privilege Separation Monitor in OpenSSH before 4.5 causes weaker verification that authentication has been successful, which might allow attackers to bypass authentication. NOTE: as of 20061108, it is believed that this issue is only exploitable by leveraging vulnerabilities in the unprivileged process, which are not known to exist.

