```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl3rnq-16szotm"
modified = 2025-11-05T03:30:10.502Z
upstream = ["CVE-2023-34194"]
references = ["https://lists.debian.org/debian-lts-announce/2023/12/msg00024.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4QCR5PIOBGDIDS6SYRESTMDJSEDFSCOE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/HOMBSHRIW5Q34SQSXYURYAOYDZD2NQF6/", "https://sourceforge.net/p/tinyxml/git/ci/master/tree/tinyxmlparser.cpp", "https://www.forescout.com/resources/sierra21-vulnerabilities", "https://lists.debian.org/debian-lts-announce/2023/12/msg00024.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4QCR5PIOBGDIDS6SYRESTMDJSEDFSCOE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/HOMBSHRIW5Q34SQSXYURYAOYDZD2NQF6/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/4QCR5PIOBGDIDS6SYRESTMDJSEDFSCOE/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/HOMBSHRIW5Q34SQSXYURYAOYDZD2NQF6/", "https://sourceforge.net/p/tinyxml/git/ci/master/tree/tinyxmlparser.cpp", "https://www.forescout.com/resources/sierra21-vulnerabilities"]

[[affected]]
pkg = "TinyXML_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-34194"
imported = 2025-11-05T03:30:10.502Z
modified = 2025-11-04T19:15:42.927Z
published = 2023-12-13T14:15:43.680Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-34194"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-34194"
```

# StringEqual in TiXmlDeclaration::Parse in tinyxmlparser.cpp in TinyXML through 2.6.2 has a reachable...

StringEqual in TiXmlDeclaration::Parse in tinyxmlparser.cpp in TinyXML through 2.6.2 has a reachable assertion (and application exit) via a crafted XML document with a '\0' located after whitespace.

