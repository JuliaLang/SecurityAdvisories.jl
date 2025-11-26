```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5g-4bw6h3"
modified = 2025-11-25T22:35:59.620Z
upstream = ["CVE-2016-5010"]
references = ["http://git.imagemagick.org/repos/ImageMagick/commit/c20de102cc57f3739a8870f79e728e3b0bea18c0", "https://bugzilla.redhat.com/show_bug.cgi?id=1354500", "https://security.gentoo.org/glsa/201611-21", "http://git.imagemagick.org/repos/ImageMagick/commit/c20de102cc57f3739a8870f79e728e3b0bea18c0", "https://bugzilla.redhat.com/show_bug.cgi?id=1354500", "https://security.gentoo.org/glsa/201611-21"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-5010"
imported = 2025-11-25T22:35:59.620Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:00.797Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-5010"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-5010"
```

# coders/tiff.c in ImageMagick before 6.9.5-3 allows remote attackers to cause a denial of service (ou...

coders/tiff.c in ImageMagick before 6.9.5-3 allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted TIFF file.

