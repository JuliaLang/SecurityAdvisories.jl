```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss62oya-add8za"
modified = 2025-11-04T03:41:39.922Z
upstream = ["CVE-2024-10978"]
references = ["https://www.postgresql.org/support/security/CVE-2024-10978/", "https://lists.debian.org/debian-lts-announce/2024/11/msg00011.html", "https://lists.debian.org/debian-lts-announce/2024/11/msg00018.html", "https://www.postgresql.org/message-id/173171334532.1547978.1518068370217143844%40wrigleys.postgresql.org"]

[[affected]]
pkg = "LibPQ_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-10978"
imported = 2025-11-04T03:41:39.922Z
modified = 2025-11-03T22:16:36.917Z
published = 2024-11-14T13:15:04.217Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-10978"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-10978"
```

# Incorrect privilege assignment in PostgreSQL allows a less-privileged application user to view or ch...

Incorrect privilege assignment in PostgreSQL allows a less-privileged application user to view or change different rows from those intended.  An attack requires the application to use SET ROLE, SET SESSION AUTHORIZATION, or an equivalent feature.  The problem arises when an application query uses parameters from the attacker or conveys query results to the attacker.  If that query reacts to current_setting('role') or the current user ID, it may modify or return data as though the session had not used SET ROLE or SET SESSION AUTHORIZATION.  The attacker does not control which incorrect user ID applies.  Query text from less-privileged sources is not a concern here, because SET ROLE and SET SESSION AUTHORIZATION are not sandboxes for unvetted queries.  Versions before PostgreSQL 17.1, 16.5, 15.9, 14.14, 13.17, and 12.21 are affected.

