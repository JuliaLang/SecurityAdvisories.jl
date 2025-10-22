```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsaq08r2-8ue9xh"
modified = 2025-10-22T22:39:46.766Z
upstream = ["CVE-2022-37434"]
references = ["http://seclists.org/fulldisclosure/2022/Oct/37", "http://seclists.org/fulldisclosure/2022/Oct/38", "http://seclists.org/fulldisclosure/2022/Oct/41", "http://seclists.org/fulldisclosure/2022/Oct/42", "http://www.openwall.com/lists/oss-security/2022/08/05/2", "http://www.openwall.com/lists/oss-security/2022/08/09/1", "https://github.com/curl/curl/issues/9271", "https://github.com/ivd38/zlib_overflow", "https://github.com/madler/zlib/blob/21767c654d31d2dccdde4330529775c6c5fd5389/zlib.h#L1062-L1063", "https://github.com/madler/zlib/commit/1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d", "https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166bece1", "https://github.com/nodejs/node/blob/75b68c6e4db515f76df73af476eccf382bbcb00a/deps/zlib/inflate.c#L762-L764", "https://lists.debian.org/debian-lts-announce/2022/09/msg00012.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JWN4VE3JQR4O2SOUS5TXNLANRPMHWV4I/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NMBOJ77A7T7PQCARMDUK75TE6LLESZ3O/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/PAVPQNCG3XRLCLNSQRM3KAN5ZFMVXVTY/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/X5U7OTKZSHY2I3ZFJSR2SHFHW72RKGDK/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YRQAI7H4M4RQZ2IWZUEEXECBE5D56BH2/", "https://security.netapp.com/advisory/ntap-20220901-0005/", "https://security.netapp.com/advisory/ntap-20230427-0007/", "https://support.apple.com/kb/HT213488", "https://support.apple.com/kb/HT213489", "https://support.apple.com/kb/HT213490", "https://support.apple.com/kb/HT213491", "https://support.apple.com/kb/HT213493", "https://support.apple.com/kb/HT213494", "https://www.debian.org/security/2022/dsa-5218", "http://seclists.org/fulldisclosure/2022/Oct/37", "http://seclists.org/fulldisclosure/2022/Oct/38", "http://seclists.org/fulldisclosure/2022/Oct/41", "http://seclists.org/fulldisclosure/2022/Oct/42", "http://www.openwall.com/lists/oss-security/2022/08/05/2", "http://www.openwall.com/lists/oss-security/2022/08/09/1", "https://github.com/curl/curl/issues/9271", "https://github.com/ivd38/zlib_overflow", "https://github.com/madler/zlib/blob/21767c654d31d2dccdde4330529775c6c5fd5389/zlib.h#L1062-L1063", "https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166bece1", "https://github.com/nodejs/node/blob/75b68c6e4db515f76df73af476eccf382bbcb00a/deps/zlib/inflate.c#L762-L764", "https://lists.debian.org/debian-lts-announce/2022/09/msg00012.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JWN4VE3JQR4O2SOUS5TXNLANRPMHWV4I/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NMBOJ77A7T7PQCARMDUK75TE6LLESZ3O/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/PAVPQNCG3XRLCLNSQRM3KAN5ZFMVXVTY/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/X5U7OTKZSHY2I3ZFJSR2SHFHW72RKGDK/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YRQAI7H4M4RQZ2IWZUEEXECBE5D56BH2/", "https://security.netapp.com/advisory/ntap-20220901-0005/", "https://security.netapp.com/advisory/ntap-20230427-0007/", "https://support.apple.com/kb/HT213488", "https://support.apple.com/kb/HT213489", "https://support.apple.com/kb/HT213490", "https://support.apple.com/kb/HT213491", "https://support.apple.com/kb/HT213493", "https://support.apple.com/kb/HT213494", "https://www.debian.org/security/2022/dsa-5218", "https://github.com/curl/curl/issues/9271"]

[[affected]]
pkg = "Zlib_jll"
ranges = ["< 1.2.13+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.27.1+0"]
[[affected]]
pkg = "GCCBootstrap_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2022-37434"
imported = 2025-10-22T22:39:46.766Z
modified = 2025-05-30T20:15:30.030Z
published = 2022-08-05T07:15:07.240Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-37434"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-37434"
```

# zlib through 1.2.12 has a heap-based buffer over-read or buffer overflow in inflate in inflate.c via...

zlib through 1.2.12 has a heap-based buffer over-read or buffer overflow in inflate in inflate.c via a large gzip header extra field. NOTE: only applications that call inflateGetHeader are affected. Some common applications bundle the affected zlib source code but may be unable to call inflateGetHeader (e.g., see the nodejs/node reference).

