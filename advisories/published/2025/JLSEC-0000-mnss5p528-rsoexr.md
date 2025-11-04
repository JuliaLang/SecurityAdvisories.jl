```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5p528-rsoexr"
modified = 2025-11-04T03:31:07.616Z
upstream = ["CVE-2024-37371"]
references = ["https://github.com/krb5/krb5/commit/55fbf435edbe2e92dd8101669b1ce7144bc96fef", "https://web.mit.edu/kerberos/www/advisories/", "https://github.com/krb5/krb5/commit/55fbf435edbe2e92dd8101669b1ce7144bc96fef", "https://security.netapp.com/advisory/ntap-20241108-0009/", "https://security.netapp.com/advisory/ntap-20250124-0010/", "https://web.mit.edu/kerberos/www/advisories/"]

[[affected]]
pkg = "Kerberos_krb5_jll"
ranges = ["< 1.21.3+0"]

[[jlsec_sources]]
id = "CVE-2024-37371"
imported = 2025-11-04T03:31:07.616Z
modified = 2025-11-03T21:16:13.997Z
published = 2024-06-28T23:15:11.603Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-37371"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-37371"
```

# In MIT Kerberos 5 (aka krb5) before 1.21.3, an attacker can cause invalid memory reads during GSS me...

In MIT Kerberos 5 (aka krb5) before 1.21.3, an attacker can cause invalid memory reads during GSS message token handling by sending message tokens with invalid length fields.

