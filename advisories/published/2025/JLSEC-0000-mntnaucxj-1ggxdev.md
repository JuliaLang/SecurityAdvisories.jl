```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucxj-1ggxdev"
modified = 2025-11-25T22:36:00.631Z
upstream = ["CVE-2021-20311"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1946739", "https://bugzilla.redhat.com/show_bug.cgi?id=1946739"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2021-20311"
imported = 2025-11-25T22:36:00.631Z
modified = 2024-11-21T05:46:21.093Z
published = 2021-05-11T23:15:08.810Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-20311"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-20311"
```

# A flaw was found in ImageMagick in versions before 7.0.11, where a division by zero in sRGBTransform...

A flaw was found in ImageMagick in versions before 7.0.11, where a division by zero in sRGBTransformImage() in the MagickCore/colorspace.c may trigger undefined behavior via a crafted image file that is submitted by an attacker processed by an application using ImageMagick. The highest threat from this vulnerability is to system availability.

