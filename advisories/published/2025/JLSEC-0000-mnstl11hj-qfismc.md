```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl11hj-qfismc"
modified = 2025-11-05T03:28:03.271Z
upstream = ["CVE-2023-38852"]
references = ["https://github.com/libxls/libxls/issues/124", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JQYGEBDBCOWBRHOW44BSSRADUOZBXHUE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YHBUPYF2NX34HNAWZ3WYHKWU3KWVQUSV/", "https://github.com/libxls/libxls/issues/124", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JQYGEBDBCOWBRHOW44BSSRADUOZBXHUE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YHBUPYF2NX34HNAWZ3WYHKWU3KWVQUSV/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/JQYGEBDBCOWBRHOW44BSSRADUOZBXHUE/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/YHBUPYF2NX34HNAWZ3WYHKWU3KWVQUSV/"]

[[affected]]
pkg = "libxls_jll"
ranges = [">= 1.6.2+0"]

[[jlsec_sources]]
id = "CVE-2023-38852"
imported = 2025-11-05T03:28:03.271Z
modified = 2025-11-04T22:15:53.637Z
published = 2023-08-15T17:15:10.760Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-38852"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-38852"
```

# Buffer Overflow vulnerability in libxlsv.1.6.2 allows a remote attacker to execute arbitrary code an...

Buffer Overflow vulnerability in libxlsv.1.6.2 allows a remote attacker to execute arbitrary code and cause a denial of service via a crafted XLS file to the unicode_decode_wcstombs function in xlstool.c:266.

