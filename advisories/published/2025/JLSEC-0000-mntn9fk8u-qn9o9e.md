```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntn9fk8u-qn9o9e"
modified = 2025-11-25T21:56:30.654Z
upstream = ["CVE-2022-4645"]
references = ["https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-4645.json", "https://gitlab.com/libtiff/libtiff/-/commit/e813112545942107551433d61afd16ac094ff246", "https://gitlab.com/libtiff/libtiff/-/issues/277", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/2ZTFA6GGOKFPIQNHDBMXYUR4XUXUJESE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BA6GRCAQ7NR2OK5N44UQRGUJBIYKWJJH/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OLM763GGZVVOAXIQXG6YGTYJ5VFYNECQ/", "https://security.netapp.com/advisory/ntap-20230331-0001/", "https://gitlab.com/gitlab-org/cves/-/blob/master/2022/CVE-2022-4645.json", "https://gitlab.com/libtiff/libtiff/-/commit/e813112545942107551433d61afd16ac094ff246", "https://gitlab.com/libtiff/libtiff/-/issues/277", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/2ZTFA6GGOKFPIQNHDBMXYUR4XUXUJESE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BA6GRCAQ7NR2OK5N44UQRGUJBIYKWJJH/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OLM763GGZVVOAXIQXG6YGTYJ5VFYNECQ/", "https://security.netapp.com/advisory/ntap-20230331-0001/"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.5.1+0"]

[[jlsec_sources]]
id = "CVE-2022-4645"
imported = 2025-11-25T21:56:30.654Z
modified = 2025-04-04T21:15:42.243Z
published = 2023-03-03T16:15:09.777Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-4645"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-4645"
```

# LibTIFF 4.4.0 has an out-of-bounds read in tiffcp in tools/tiffcp.c:948, allowing attackers to cause...

LibTIFF 4.4.0 has an out-of-bounds read in tiffcp in tools/tiffcp.c:948, allowing attackers to cause a denial-of-service via a crafted tiff file. For users that compile libtiff from sources, the fix is available with commit e8131125.

