```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5nzcd-lpvq7j"
modified = 2025-11-04T03:30:13.549Z
upstream = ["CVE-2024-26306"]
references = ["https://downloads.es.net/pub/iperf/esnet-secadv-2024-0001.txt.asc", "https://github.com/esnet/iperf/releases/tag/3.17", "https://www.insyde.com/security-pledge/SA-2024005", "https://downloads.es.net/pub/iperf/esnet-secadv-2024-0001.txt.asc", "https://github.com/esnet/iperf/releases/tag/3.17", "https://lists.debian.org/debian-lts-announce/2025/01/msg00027.html", "https://security.netapp.com/advisory/ntap-20250228-0007/"]

[[affected]]
pkg = "iperf_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-26306"
imported = 2025-11-04T03:30:13.549Z
modified = 2025-11-03T21:16:07.653Z
published = 2024-05-14T15:08:51.197Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-26306"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-26306"
```

# iPerf3 before 3.17, when used with OpenSSL before 3.2.0 as a server with RSA authentication, allows ...

iPerf3 before 3.17, when used with OpenSSL before 3.2.0 as a server with RSA authentication, allows a timing side channel in RSA decryption operations. This side channel could be sufficient for an attacker to recover credential plaintext. It requires the attacker to send a large number of messages for decryption, as described in "Everlasting ROBOT: the Marvin Attack" by Hubert Kario.

