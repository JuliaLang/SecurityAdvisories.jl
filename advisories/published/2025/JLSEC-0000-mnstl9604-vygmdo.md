```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl9604-vygmdo"
modified = 2025-11-05T03:34:22.372Z
upstream = ["CVE-2023-39804"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1058079", "https://git.savannah.gnu.org/cgit/tar.git/commit/?id=a339f05cd269013fa133d2f148d73f6f7d4247e4", "https://git.savannah.gnu.org/cgit/tar.git/tree/src/xheader.c?h=release_1_34#n1723", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1058079", "https://git.savannah.gnu.org/cgit/tar.git/commit/?id=a339f05cd269013fa133d2f148d73f6f7d4247e4", "https://git.savannah.gnu.org/cgit/tar.git/tree/src/xheader.c?h=release_1_34#n1723", "https://lists.debian.org/debian-lts-announce/2024/03/msg00008.html"]

[[affected]]
pkg = "Tar_jll"
ranges = ["< 1.35.0+0"]

[[jlsec_sources]]
id = "CVE-2023-39804"
imported = 2025-11-05T03:34:22.372Z
modified = 2025-11-04T19:15:55.430Z
published = 2024-03-27T04:15:08.897Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-39804"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-39804"
```

# In GNU tar before 1.35, mishandled extension attributes in a PAX archive can lead to an application ...

In GNU tar before 1.35, mishandled extension attributes in a PAX archive can lead to an application crash in xheader.c.

