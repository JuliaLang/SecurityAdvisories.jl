```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl0bqt-10h52h"
modified = 2025-11-05T03:27:29.909Z
upstream = ["CVE-2021-42260"]
references = ["https://lists.debian.org/debian-lts-announce/2022/04/msg00019.html", "https://lists.debian.org/debian-lts-announce/2022/09/msg00041.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4QCR5PIOBGDIDS6SYRESTMDJSEDFSCOE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/HOMBSHRIW5Q34SQSXYURYAOYDZD2NQF6/", "https://sourceforge.net/p/tinyxml/bugs/141/", "https://lists.debian.org/debian-lts-announce/2022/04/msg00019.html", "https://lists.debian.org/debian-lts-announce/2022/09/msg00041.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4QCR5PIOBGDIDS6SYRESTMDJSEDFSCOE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/HOMBSHRIW5Q34SQSXYURYAOYDZD2NQF6/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/4QCR5PIOBGDIDS6SYRESTMDJSEDFSCOE/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/HOMBSHRIW5Q34SQSXYURYAOYDZD2NQF6/", "https://sourceforge.net/p/tinyxml/bugs/141/"]

[[affected]]
pkg = "TinyXML_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2021-42260"
imported = 2025-11-05T03:27:29.909Z
modified = 2025-11-04T19:15:40.767Z
published = 2021-10-11T20:15:07.433Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-42260"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-42260"
```

# TinyXML through 2.6.2 has an infinite loop in TiXmlParsingData::Stamp in tinyxmlparser.cpp via the T...

TinyXML through 2.6.2 has an infinite loop in TiXmlParsingData::Stamp in tinyxmlparser.cpp via the TIXML_UTF_LEAD_0 case. It can be triggered by a crafted XML message and leads to a denial of service.

