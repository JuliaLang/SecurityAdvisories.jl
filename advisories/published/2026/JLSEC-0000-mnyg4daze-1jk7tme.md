```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4daze-1jk7tme"
modified = 2026-03-26T21:18:55.706Z
upstream = ["CVE-2020-15778"]
references = ["https://access.redhat.com/errata/RHSA-2024:3166", "https://github.com/cpandya2909/CVE-2020-15778/", "https://news.ycombinator.com/item?id=25005567", "https://security.gentoo.org/glsa/202212-06", "https://security.netapp.com/advisory/ntap-20200731-0007/", "https://www.openssh.com/security.html", "https://access.redhat.com/errata/RHSA-2024:3166", "https://github.com/cpandya2909/CVE-2020-15778/", "https://news.ycombinator.com/item?id=25005567", "https://security.gentoo.org/glsa/202212-06", "https://security.netapp.com/advisory/ntap-20200731-0007/", "https://www.openssh.com/security.html"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2020-15778"
imported = 2026-03-26T21:18:55.706Z
modified = 2025-07-28T18:12:45.213Z
published = 2020-07-24T14:15:12.450Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-15778"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-15778"
```

# scp in OpenSSH through 8.3p1 allows command injection in the scp.c toremote function, as demonstrate...

scp in OpenSSH through 8.3p1 allows command injection in the scp.c toremote function, as demonstrated by backtick characters in the destination argument. NOTE: the vendor reportedly has stated that they intentionally omit validation of "anomalous argument transfers" because that could "stand a great chance of breaking existing workflows."

