```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns68tglb-1vrjfw1"
modified = 2025-10-19T19:27:32.159Z
upstream = ["CVE-2023-31484"]
references = ["http://www.openwall.com/lists/oss-security/2023/04/29/1", "http://www.openwall.com/lists/oss-security/2023/05/03/3", "http://www.openwall.com/lists/oss-security/2023/05/03/5", "http://www.openwall.com/lists/oss-security/2023/05/07/2", "https://blog.hackeriet.no/perl-http-tiny-insecure-tls-default-affects-cpan-modules/", "https://github.com/andk/cpanpm/pull/175", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BM6UW55CNFUTNGD5ZRKGUKKKFDJGMFHL/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LEGCEOKFJVBJ2QQ6S2H4NAEWTUERC7SB/", "https://metacpan.org/dist/CPAN/changes", "https://security.netapp.com/advisory/ntap-20240621-0007/", "https://www.openwall.com/lists/oss-security/2023/04/18/14", "http://www.openwall.com/lists/oss-security/2023/04/29/1", "http://www.openwall.com/lists/oss-security/2023/05/03/3", "http://www.openwall.com/lists/oss-security/2023/05/03/5", "http://www.openwall.com/lists/oss-security/2023/05/07/2", "https://blog.hackeriet.no/perl-http-tiny-insecure-tls-default-affects-cpan-modules/", "https://github.com/andk/cpanpm/pull/175", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BM6UW55CNFUTNGD5ZRKGUKKKFDJGMFHL/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LEGCEOKFJVBJ2QQ6S2H4NAEWTUERC7SB/", "https://metacpan.org/dist/CPAN/changes", "https://security.netapp.com/advisory/ntap-20240621-0007/", "https://www.openwall.com/lists/oss-security/2023/04/18/14"]

[[affected]]
pkg = "Perl_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-31484"
imported = 2025-10-19T19:27:32.137Z
modified = 2024-11-21T08:01:57.707Z
published = 2023-04-29T00:15:09.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-31484"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-31484"
```

# CPAN.pm before 2.35 does not verify TLS certificates when downloading distributions over HTTPS.

CPAN.pm before 2.35 does not verify TLS certificates when downloading distributions over HTTPS.

