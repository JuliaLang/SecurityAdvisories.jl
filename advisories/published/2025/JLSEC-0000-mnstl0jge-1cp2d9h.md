```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl0jge-1cp2d9h"
modified = 2025-11-05T03:27:39.902Z
upstream = ["CVE-2021-33621"]
references = ["https://lists.debian.org/debian-lts-announce/2023/06/msg00012.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DQR7LWED6VAPD5ATYOBZIGJQPCUBRJBX/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/THVTYHHEOVLQFCFHWURZYO7PVUPBHRZD/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YACE6ORF2QBXXBK2V2CM36D7TZMEJVAS/", "https://security.gentoo.org/glsa/202401-27", "https://security.netapp.com/advisory/ntap-20221228-0004/", "https://www.ruby-lang.org/en/news/2022/11/22/http-response-splitting-in-cgi-cve-2021-33621/", "https://lists.debian.org/debian-lts-announce/2023/06/msg00012.html", "https://lists.debian.org/debian-lts-announce/2024/09/msg00000.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DQR7LWED6VAPD5ATYOBZIGJQPCUBRJBX/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/THVTYHHEOVLQFCFHWURZYO7PVUPBHRZD/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YACE6ORF2QBXXBK2V2CM36D7TZMEJVAS/", "https://security.gentoo.org/glsa/202401-27", "https://security.netapp.com/advisory/ntap-20221228-0004/", "https://www.ruby-lang.org/en/news/2022/11/22/http-response-splitting-in-cgi-cve-2021-33621/"]

[[affected]]
pkg = "ruby_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2021-33621"
imported = 2025-11-05T03:27:39.902Z
modified = 2025-11-04T16:15:42.820Z
published = 2022-11-18T23:15:18.987Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-33621"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-33621"
```

# The cgi gem before 0.1.0.2, 0.2.x before 0.2.2, and 0.3.x before 0.3.5 for Ruby allows HTTP response...

The cgi gem before 0.1.0.2, 0.2.x before 0.2.2, and 0.3.x before 0.3.5 for Ruby allows HTTP response splitting. This is relevant to applications that use untrusted user input either to generate an HTTP response or to create a CGI::Cookie object.

