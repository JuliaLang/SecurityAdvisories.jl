```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntn9i1wv-3grm6k"
modified = 2025-11-25T21:58:26.863Z
upstream = ["CVE-2022-36227"]
references = ["https://bugs.gentoo.org/882521", "https://github.com/libarchive/libarchive/blob/v3.0.0a/libarchive/archive_write.c#L215", "https://github.com/libarchive/libarchive/issues/1754", "https://lists.debian.org/debian-lts-announce/2023/01/msg00034.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/V67OO2UUQAUJS3IK4JZPF6F3LUCBU6IS/", "https://security.gentoo.org/glsa/202309-14", "https://bugs.gentoo.org/882521", "https://github.com/libarchive/libarchive/blob/v3.0.0a/libarchive/archive_write.c#L215", "https://github.com/libarchive/libarchive/issues/1754", "https://lists.debian.org/debian-lts-announce/2023/01/msg00034.html", "https://lists.debian.org/debian-lts-announce/2024/11/msg00007.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/V67OO2UUQAUJS3IK4JZPF6F3LUCBU6IS/", "https://security.gentoo.org/glsa/202309-14"]

[[affected]]
pkg = "LibArchive_jll"
ranges = ["< 3.7.4+0"]

[[jlsec_sources]]
id = "CVE-2022-36227"
imported = 2025-11-25T21:58:26.863Z
modified = 2025-11-03T22:15:59.710Z
published = 2022-11-22T02:15:11.003Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-36227"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-36227"
```

# In libarchive before 3.6.2, the software does not check for an error after calling calloc function t...

In libarchive before 3.6.2, the software does not check for an error after calling calloc function that can return with a NULL pointer if the function fails, which leads to a resultant NULL pointer dereference. NOTE: the discoverer cites this CWE-476 remark but third parties dispute the code-execution impact: "In rare circumstances, when NULL is equivalent to the 0x0 memory address and privileged code can access it, then writing or reading memory is possible, which may lead to code execution."

