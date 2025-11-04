```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss62obw-17h1ezf"
modified = 2025-11-04T03:41:39.116Z
upstream = ["CVE-2024-10976"]
references = ["https://www.postgresql.org/support/security/CVE-2024-10976/", "https://lists.debian.org/debian-lts-announce/2024/11/msg00011.html", "https://security.netapp.com/advisory/ntap-20250509-0010/"]

[[affected]]
pkg = "LibPQ_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-10976"
imported = 2025-11-04T03:41:39.116Z
modified = 2025-11-03T22:16:36.700Z
published = 2024-11-14T13:15:03.793Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-10976"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-10976"
```

# Incomplete tracking in PostgreSQL of tables with row security allows a reused query to view or chang...

Incomplete tracking in PostgreSQL of tables with row security allows a reused query to view or change different rows from those intended.  CVE-2023-2455 and CVE-2016-2193 fixed most interaction between row security and user ID changes.  They missed cases where a subquery, WITH query, security invoker view, or SQL-language function references a table with a row-level security policy.  This has the same consequences as the two earlier CVEs.  That is to say, it leads to potentially incorrect policies being applied in cases where role-specific policies are used and a given query is planned under one role and then executed under other roles.  This scenario can happen under security definer functions or when a common user and query is planned initially and then re-used across multiple SET ROLEs.  Applying an incorrect policy may permit a user to complete otherwise-forbidden reads and modifications.  This affects only databases that have used CREATE POLICY to define a row security policy.  An attacker must tailor an attack to a particular application's pattern of query plan reuse, user ID changes, and role-specific row security policies.  Versions before PostgreSQL 17.1, 16.5, 15.9, 14.14, 13.17, and 12.21 are affected.

