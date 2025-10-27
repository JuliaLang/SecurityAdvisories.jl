```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns68s11b-cadmb0"
modified = 2025-10-19T19:26:25.343Z
upstream = ["CVE-2021-36976"]
references = ["http://seclists.org/fulldisclosure/2022/Mar/27", "http://seclists.org/fulldisclosure/2022/Mar/28", "http://seclists.org/fulldisclosure/2022/Mar/29", "https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=32375", "https://github.com/google/oss-fuzz-vulns/blob/main/vulns/libarchive/OSV-2021-557.yaml", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/SE5NJQNM22ZE5Z55LPAGCUHSBQZBKMKC/", "https://security.gentoo.org/glsa/202208-26", "https://support.apple.com/kb/HT213182", "https://support.apple.com/kb/HT213183", "https://support.apple.com/kb/HT213193", "http://seclists.org/fulldisclosure/2022/Mar/27", "http://seclists.org/fulldisclosure/2022/Mar/28", "http://seclists.org/fulldisclosure/2022/Mar/29", "https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=32375", "https://github.com/google/oss-fuzz-vulns/blob/main/vulns/libarchive/OSV-2021-557.yaml", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/SE5NJQNM22ZE5Z55LPAGCUHSBQZBKMKC/", "https://security.gentoo.org/glsa/202208-26", "https://support.apple.com/kb/HT213182", "https://support.apple.com/kb/HT213183", "https://support.apple.com/kb/HT213193"]

[[affected]]
pkg = "LibArchive_jll"
ranges = ["< 3.7.4+0"]

[[jlsec_sources]]
id = "CVE-2021-36976"
imported = 2025-10-19T19:26:25.343Z
modified = 2024-11-21T06:14:25.400Z
published = 2021-07-20T07:15:07.950Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-36976"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-36976"
```

# libarchive 3.4.1 through 3.5.1 has a use-after-free in copy_string (called from do_uncompress_block ...

libarchive 3.4.1 through 3.5.1 has a use-after-free in copy_string (called from do_uncompress_block and process_block).

