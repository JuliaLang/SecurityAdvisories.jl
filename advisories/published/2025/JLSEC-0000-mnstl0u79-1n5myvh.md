```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl0u79-1n5myvh"
modified = 2025-11-05T03:27:53.829Z
upstream = ["CVE-2023-30589"]
references = ["https://hackerone.com/reports/2001873", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/HMEELCREWMRT6NS7HWXLA6XFLLMO36HE/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/IV326O2X4BE3SINX5FJHMAKVHUAA4ZYF/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/UEJWL67XR67JAGEL2ZK22NA3BRKNMZNY/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/VCVG4TQRGTK4LKAZKVEQAUEJM7DUACYE/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/VEEQIN5242K5NBE2CZ4DYTNA5B4YTYE5/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/VKFMKD4MJZIKFQJAAJ4VZ2FHIJ764A76/", "https://security.netapp.com/advisory/ntap-20230803-0009/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://hackerone.com/reports/2001873", "https://lists.debian.org/debian-lts-announce/2024/09/msg00029.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/HMEELCREWMRT6NS7HWXLA6XFLLMO36HE/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/IV326O2X4BE3SINX5FJHMAKVHUAA4ZYF/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/UEJWL67XR67JAGEL2ZK22NA3BRKNMZNY/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/VCVG4TQRGTK4LKAZKVEQAUEJM7DUACYE/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/VEEQIN5242K5NBE2CZ4DYTNA5B4YTYE5/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/VKFMKD4MJZIKFQJAAJ4VZ2FHIJ764A76/", "https://security.netapp.com/advisory/ntap-20230803-0009/", "https://security.netapp.com/advisory/ntap-20240621-0006/"]

[[affected]]
pkg = "libnode_jll"
ranges = [">= 16.14.0+0"]

[[jlsec_sources]]
id = "CVE-2023-30589"
imported = 2025-11-05T03:27:53.829Z
modified = 2025-11-04T17:15:36.953Z
published = 2023-07-01T00:15:10.293Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-30589"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-30589"
```

# The llhttp parser in the http module in Node v20.2.0 does not strictly use the CRLF sequence to deli...

The llhttp parser in the http module in Node v20.2.0 does not strictly use the CRLF sequence to delimit HTTP requests. This can lead to HTTP Request Smuggling (HRS).

The CR character (without LF) is sufficient to delimit HTTP header fields in the llhttp parser. According to RFC7230 section 3, only the CRLF sequence should delimit each header-field. This impacts all Node.js active versions: v16, v18, and, v20

