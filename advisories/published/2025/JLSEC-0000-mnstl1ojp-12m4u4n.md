```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl1ojp-12m4u4n"
modified = 2025-11-05T03:28:33.157Z
upstream = ["CVE-2023-5868"]
references = ["https://access.redhat.com/errata/RHSA-2023:7545", "https://access.redhat.com/errata/RHSA-2023:7579", "https://access.redhat.com/errata/RHSA-2023:7580", "https://access.redhat.com/errata/RHSA-2023:7581", "https://access.redhat.com/errata/RHSA-2023:7616", "https://access.redhat.com/errata/RHSA-2023:7656", "https://access.redhat.com/errata/RHSA-2023:7666", "https://access.redhat.com/errata/RHSA-2023:7667", "https://access.redhat.com/errata/RHSA-2023:7694", "https://access.redhat.com/errata/RHSA-2023:7695", "https://access.redhat.com/errata/RHSA-2023:7714", "https://access.redhat.com/errata/RHSA-2023:7770", "https://access.redhat.com/errata/RHSA-2023:7772", "https://access.redhat.com/errata/RHSA-2023:7784", "https://access.redhat.com/errata/RHSA-2023:7785", "https://access.redhat.com/errata/RHSA-2023:7883", "https://access.redhat.com/errata/RHSA-2023:7884", "https://access.redhat.com/errata/RHSA-2023:7885", "https://access.redhat.com/errata/RHSA-2024:0304", "https://access.redhat.com/errata/RHSA-2024:0332", "https://access.redhat.com/errata/RHSA-2024:0337", "https://access.redhat.com/security/cve/CVE-2023-5868", "https://bugzilla.redhat.com/show_bug.cgi?id=2247168", "https://www.postgresql.org/about/news/postgresql-161-155-1410-1313-1217-and-1122-released-2749/", "https://www.postgresql.org/support/security/CVE-2023-5868/", "https://access.redhat.com/errata/RHSA-2023:7545", "https://access.redhat.com/errata/RHSA-2023:7579", "https://access.redhat.com/errata/RHSA-2023:7580", "https://access.redhat.com/errata/RHSA-2023:7581", "https://access.redhat.com/errata/RHSA-2023:7616", "https://access.redhat.com/errata/RHSA-2023:7656", "https://access.redhat.com/errata/RHSA-2023:7666", "https://access.redhat.com/errata/RHSA-2023:7667", "https://access.redhat.com/errata/RHSA-2023:7694", "https://access.redhat.com/errata/RHSA-2023:7695", "https://access.redhat.com/errata/RHSA-2023:7714", "https://access.redhat.com/errata/RHSA-2023:7770", "https://access.redhat.com/errata/RHSA-2023:7772", "https://access.redhat.com/errata/RHSA-2023:7784", "https://access.redhat.com/errata/RHSA-2023:7785", "https://access.redhat.com/errata/RHSA-2023:7883", "https://access.redhat.com/errata/RHSA-2023:7884", "https://access.redhat.com/errata/RHSA-2023:7885", "https://access.redhat.com/errata/RHSA-2024:0304", "https://access.redhat.com/errata/RHSA-2024:0332", "https://access.redhat.com/errata/RHSA-2024:0337", "https://access.redhat.com/security/cve/CVE-2023-5868", "https://bugzilla.redhat.com/show_bug.cgi?id=2247168", "https://lists.debian.org/debian-lts-announce/2023/11/msg00007.html", "https://security.netapp.com/advisory/ntap-20240119-0003/", "https://www.postgresql.org/about/news/postgresql-161-155-1410-1313-1217-and-1122-released-2749/", "https://www.postgresql.org/support/security/CVE-2023-5868/"]

[[affected]]
pkg = "LibPQ_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-5868"
imported = 2025-11-05T03:28:33.157Z
modified = 2025-11-04T20:17:13.493Z
published = 2023-12-10T18:15:07.163Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-5868"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-5868"
```

# A memory disclosure vulnerability was found in PostgreSQL that allows remote users to access sensiti...

A memory disclosure vulnerability was found in PostgreSQL that allows remote users to access sensitive information by exploiting certain aggregate function calls with 'unknown'-type arguments. Handling 'unknown'-type values from string literals without type designation can disclose bytes, potentially revealing notable and confidential information. This issue exists due to excessive data output in aggregate function calls, enabling remote users to read some portion of system memory.

