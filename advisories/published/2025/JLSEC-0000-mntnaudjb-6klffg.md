```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaudjb-6klffg"
modified = 2025-11-25T22:36:01.415Z
upstream = ["CVE-2025-55005"]
references = ["https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-v393-38qx-v8fp", "https://goo.gle/bigsleep", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-v393-38qx-v8fp"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.2001+0"]

[[jlsec_sources]]
id = "CVE-2025-55005"
imported = 2025-11-25T22:36:01.415Z
modified = 2025-08-15T19:36:34.257Z
published = 2025-08-13T14:15:32.883Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-55005"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-55005"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Prior to version 7.1.2-1, when preparing to transform from Log to sRGB colorspaces, the logmap construction fails to handle cases where the reference-black or reference-white value is larger than 1024. This leads to corrupting memory beyond the end of the allocated logmap buffer. This issue has been patched in version 7.1.2-1.

