```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss62pgs-1ltf6kt"
modified = 2025-11-04T03:41:40.588Z
upstream = ["CVE-2024-10979"]
references = ["https://www.postgresql.org/support/security/CVE-2024-10979/", "https://github.com/fmora50591/postgresql-env-vuln/blob/main/README.md", "https://lists.debian.org/debian-lts-announce/2024/11/msg00011.html", "https://security.netapp.com/advisory/ntap-20250110-0003/"]

[[affected]]
pkg = "LibPQ_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-10979"
imported = 2025-11-04T03:41:40.588Z
modified = 2025-11-03T22:16:37.020Z
published = 2024-11-14T13:15:04.407Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-10979"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-10979"
```

# Incorrect control of environment variables in PostgreSQL PL/Perl allows an unprivileged database use...

Incorrect control of environment variables in PostgreSQL PL/Perl allows an unprivileged database user to change sensitive process environment variables (e.g. PATH).  That often suffices to enable arbitrary code execution, even if the attacker lacks a database server operating system user.  Versions before PostgreSQL 17.1, 16.5, 15.9, 14.14, 13.17, and 12.21 are affected.

