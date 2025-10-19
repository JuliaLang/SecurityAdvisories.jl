```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns68tgui-f4xo19"
modified = 2025-10-19T19:27:32.490Z
upstream = ["CVE-2023-31486"]
references = ["http://www.openwall.com/lists/oss-security/2023/04/29/1", "http://www.openwall.com/lists/oss-security/2023/05/03/3", "http://www.openwall.com/lists/oss-security/2023/05/03/5", "http://www.openwall.com/lists/oss-security/2023/05/07/2", "https://blog.hackeriet.no/perl-http-tiny-insecure-tls-default-affects-cpan-modules/", "https://github.com/chansen/p5-http-tiny/pull/153", "https://hackeriet.github.io/cpan-http-tiny-overview/", "https://www.openwall.com/lists/oss-security/2023/04/18/14", "https://www.openwall.com/lists/oss-security/2023/05/03/4", "https://www.reddit.com/r/perl/comments/111tadi/psa_httptiny_disabled_ssl_verification_by_default/", "http://www.openwall.com/lists/oss-security/2023/04/29/1", "http://www.openwall.com/lists/oss-security/2023/05/03/3", "http://www.openwall.com/lists/oss-security/2023/05/03/5", "http://www.openwall.com/lists/oss-security/2023/05/07/2", "https://blog.hackeriet.no/perl-http-tiny-insecure-tls-default-affects-cpan-modules/", "https://github.com/chansen/p5-http-tiny/pull/153", "https://hackeriet.github.io/cpan-http-tiny-overview/", "https://security.netapp.com/advisory/ntap-20241129-0011/", "https://www.openwall.com/lists/oss-security/2023/04/18/14", "https://www.openwall.com/lists/oss-security/2023/05/03/4", "https://www.reddit.com/r/perl/comments/111tadi/psa_httptiny_disabled_ssl_verification_by_default/"]

[[affected]]
pkg = "Perl_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-31486"
imported = 2025-10-19T19:27:32.490Z
modified = 2025-01-30T20:15:32.297Z
published = 2023-04-29T00:15:09.083Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-31486"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-31486"
```

# HTTP::Tiny before 0.083, a Perl core module since 5.13.9 and available standalone on CPAN, has an in...

HTTP::Tiny before 0.083, a Perl core module since 5.13.9 and available standalone on CPAN, has an insecure default TLS configuration where users must opt in to verify certificates.

