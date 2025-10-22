```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsaq09aq-3bj4s3"
modified = 2025-10-22T22:39:47.474Z
upstream = ["CVE-2023-45853"]
references = ["http://www.openwall.com/lists/oss-security/2023/10/20/9", "http://www.openwall.com/lists/oss-security/2024/01/24/10", "https://chromium.googlesource.com/chromium/src/+/d709fb23806858847131027da95ef4c548813356", "https://chromium.googlesource.com/chromium/src/+/de29dd6c7151d3cd37cb4cf0036800ddfb1d8b61", "https://github.com/madler/zlib/blob/ac8f12c97d1afd9bafa9c710f827d40a407d3266/contrib/README.contrib#L1-L4", "https://github.com/madler/zlib/pull/843", "https://lists.debian.org/debian-lts-announce/2023/11/msg00026.html", "https://pypi.org/project/pyminizip/#history", "https://security.gentoo.org/glsa/202401-18", "https://security.netapp.com/advisory/ntap-20231130-0009/", "https://www.winimage.com/zLibDll/minizip.html", "http://www.openwall.com/lists/oss-security/2023/10/20/9", "http://www.openwall.com/lists/oss-security/2024/01/24/10", "https://chromium.googlesource.com/chromium/src/+/d709fb23806858847131027da95ef4c548813356", "https://chromium.googlesource.com/chromium/src/+/de29dd6c7151d3cd37cb4cf0036800ddfb1d8b61", "https://github.com/madler/zlib/blob/ac8f12c97d1afd9bafa9c710f827d40a407d3266/contrib/README.contrib#L1-L4", "https://github.com/madler/zlib/pull/843", "https://lists.debian.org/debian-lts-announce/2023/11/msg00026.html", "https://pypi.org/project/pyminizip/#history", "https://security.gentoo.org/glsa/202401-18", "https://security.netapp.com/advisory/ntap-20231130-0009/", "https://www.winimage.com/zLibDll/minizip.html"]

[[affected]]
pkg = "Zlib_jll"
ranges = ["< 1.3.1+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.27.1+0"]
[[affected]]
pkg = "GCCBootstrap_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-45853"
imported = 2025-10-22T22:39:47.474Z
modified = 2024-12-20T17:41:31.237Z
published = 2023-10-14T02:15:09.323Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-45853"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-45853"
```

# MiniZip in zlib through 1.3 has an integer overflow and resultant heap-based buffer overflow in zipO...

MiniZip in zlib through 1.3 has an integer overflow and resultant heap-based buffer overflow in zipOpenNewFileInZip4_64 via a long filename, comment, or extra field. NOTE: MiniZip is not a supported part of the zlib product. NOTE: pyminizip through 0.2.6 is also vulnerable because it bundles an affected zlib version, and exposes the applicable MiniZip code through its compress API.

