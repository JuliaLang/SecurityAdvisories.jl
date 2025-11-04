```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5ipaz-avn7nl"
modified = 2025-11-04T03:26:07.259Z
upstream = ["CVE-2022-1122"]
references = ["https://github.com/uclouvain/openjpeg/issues/1368", "https://lists.debian.org/debian-lts-announce/2022/04/msg00006.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/MIWSQFQWXDU4MT3XTVAO6HC7TVL3NHS7/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RMKBAMK2CAM5TMC5TODKVCE5AAPTD5YV/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ROSN5NRUFOH7HGLJ4ZSKPGAKLFXJALW4/", "https://security.gentoo.org/glsa/202209-04", "https://github.com/uclouvain/openjpeg/issues/1368", "https://lists.debian.org/debian-lts-announce/2022/04/msg00006.html", "https://lists.debian.org/debian-lts-announce/2025/04/msg00002.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/MIWSQFQWXDU4MT3XTVAO6HC7TVL3NHS7/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RMKBAMK2CAM5TMC5TODKVCE5AAPTD5YV/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ROSN5NRUFOH7HGLJ4ZSKPGAKLFXJALW4/", "https://security.gentoo.org/glsa/202209-04"]

[[affected]]
pkg = "OpenJpeg_jll"
ranges = [">= 2.4.0+0, < 2.5.0+0"]

[[jlsec_sources]]
id = "CVE-2022-1122"
imported = 2025-11-04T03:26:07.259Z
modified = 2025-11-03T20:15:52.347Z
published = 2022-03-29T18:15:07.977Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-1122"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-1122"
```

# A flaw was found in the opj2_decompress program in openjpeg2 2.4.0 in the way it handles an input di...

A flaw was found in the opj2_decompress program in openjpeg2 2.4.0 in the way it handles an input directory with a large number of files. When it fails to allocate a buffer to store the filenames of the input directory, it calls free() on an uninitialized pointer, leading to a segmentation fault and a denial of service.

