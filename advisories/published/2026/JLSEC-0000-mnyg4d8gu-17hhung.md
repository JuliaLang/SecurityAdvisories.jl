```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d8gu-17hhung"
modified = 2026-03-26T21:18:52.446Z
upstream = ["CVE-2010-4478"]
references = ["http://kb.juniper.net/InfoCenter/index?page=content&id=JSA10673", "http://seb.dbzteam.org/crypto/jpake-session-key-retrieval.pdf", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/jpake.c#rev1.5", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/jpake.c.diff?r1=1.4%3Br2=1.5%3Bf=h", "https://bugzilla.redhat.com/show_bug.cgi?id=659297", "https://github.com/seb-m/jpake", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A12338", "http://kb.juniper.net/InfoCenter/index?page=content&id=JSA10673", "http://seb.dbzteam.org/crypto/jpake-session-key-retrieval.pdf", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/jpake.c#rev1.5", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/jpake.c.diff?r1=1.4%3Br2=1.5%3Bf=h", "https://bugzilla.redhat.com/show_bug.cgi?id=659297", "https://github.com/seb-m/jpake", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A12338"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2010-4478"
imported = 2026-03-26T21:18:52.446Z
modified = 2025-04-11T00:51:21.963Z
published = 2010-12-06T22:30:31.920Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2010-4478"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2010-4478"
```

# OpenSSH 5.6 and earlier, when J-PAKE is enabled, does not properly validate the public parameters in...

OpenSSH 5.6 and earlier, when J-PAKE is enabled, does not properly validate the public parameters in the J-PAKE protocol, which allows remote attackers to bypass the need for knowledge of the shared secret, and successfully authenticate, by sending crafted values in each round of the protocol, a related issue to CVE-2010-4252.

