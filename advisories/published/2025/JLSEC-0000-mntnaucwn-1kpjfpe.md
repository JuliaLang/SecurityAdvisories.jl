```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucwn-1kpjfpe"
modified = 2025-11-25T22:36:00.599Z
upstream = ["CVE-2020-25663"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1891601", "https://github.com/ImageMagick/ImageMagick/issues/1723", "https://github.com/ImageMagick/ImageMagick/issues/1723#issuecomment-718275153", "https://bugzilla.redhat.com/show_bug.cgi?id=1891601", "https://github.com/ImageMagick/ImageMagick/issues/1723", "https://github.com/ImageMagick/ImageMagick/issues/1723#issuecomment-718275153"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2020-25663"
imported = 2025-11-25T22:36:00.599Z
modified = 2024-11-21T05:18:23.650Z
published = 2020-12-08T21:15:12.420Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-25663"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-25663"
```

# A call to ConformPixelInfo() in the SetImageAlphaChannel() routine of /MagickCore/channel.c caused a...

A call to ConformPixelInfo() in the SetImageAlphaChannel() routine of /MagickCore/channel.c caused a subsequent heap-use-after-free or heap-buffer-overflow READ when GetPixelRed() or GetPixelBlue() was called. This could occur if an attacker is able to submit a malicious image file to be processed by ImageMagick and could lead to denial of service. It likely would not lead to anything further because the memory is used as pixel data and not e.g. a function pointer. This flaw affects ImageMagick versions prior to 7.0.9-0.

