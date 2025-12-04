```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntz1081x-15k7hy9"
modified = 2025-12-04T03:33:52.197Z
upstream = ["CVE-2021-33560"]
references = ["https://dev.gnupg.org/T5305", "https://dev.gnupg.org/T5328", "https://dev.gnupg.org/T5466", "https://dev.gnupg.org/rCe8b7f10be275bcedb5fc05ed4837a89bfd605c61", "https://lists.debian.org/debian-lts-announce/2021/06/msg00021.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BKKTOIGFW2SGN3DO2UHHVZ7MJSYN4AAB/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/R7OAPCUGPF3VLA7QAJUQSL255D4ITVTL/", "https://security.gentoo.org/glsa/202210-13", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpujan2022.html", "https://www.oracle.com/security-alerts/cpujul2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html", "https://dev.gnupg.org/T5305", "https://dev.gnupg.org/T5328", "https://dev.gnupg.org/T5466", "https://dev.gnupg.org/rCe8b7f10be275bcedb5fc05ed4837a89bfd605c61", "https://lists.debian.org/debian-lts-announce/2021/06/msg00021.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BKKTOIGFW2SGN3DO2UHHVZ7MJSYN4AAB/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/R7OAPCUGPF3VLA7QAJUQSL255D4ITVTL/", "https://security.gentoo.org/glsa/202210-13", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpujan2022.html", "https://www.oracle.com/security-alerts/cpujul2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html"]

[[affected]]
pkg = "Libgcrypt_jll"
ranges = ["< 1.8.11+0"]

[[jlsec_sources]]
id = "CVE-2021-33560"
imported = 2025-12-04T03:33:52.197Z
modified = 2025-12-03T15:15:49.833Z
published = 2021-06-08T11:15:07.767Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-33560"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-33560"
```

# Libgcrypt before 1.8.8 and 1.9.x before 1.9.3 mishandles ElGamal encryption because it lacks exponen...

Libgcrypt before 1.8.8 and 1.9.x before 1.9.3 mishandles ElGamal encryption because it lacks exponent blinding to address a side-channel attack against mpi_powm, and the window size is not chosen appropriately. This, for example, affects use of ElGamal in OpenPGP.

