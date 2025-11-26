```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5t-5zd950"
modified = 2025-11-25T22:35:59.633Z
upstream = ["CVE-2016-7540"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93228", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1594060", "https://bugzilla.redhat.com/show_bug.cgi?id=1378777", "https://github.com/ImageMagick/ImageMagick/commit/a0108a892f9ea3c2bb1e7a49b7d71376c2ecbff7", "https://github.com/ImageMagick/ImageMagick/pull/223", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93228", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1594060", "https://bugzilla.redhat.com/show_bug.cgi?id=1378777", "https://github.com/ImageMagick/ImageMagick/commit/a0108a892f9ea3c2bb1e7a49b7d71376c2ecbff7", "https://github.com/ImageMagick/ImageMagick/pull/223"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7540"
imported = 2025-11-25T22:35:59.633Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:01.530Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7540"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7540"
```

# coders/rgf.c in ImageMagick before 6.9.4-10 allows remote attackers to cause a denial of service (as...

coders/rgf.c in ImageMagick before 6.9.4-10 allows remote attackers to cause a denial of service (assertion failure) by converting an image to rgf format.

