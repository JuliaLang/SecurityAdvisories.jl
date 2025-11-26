```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucxy-827pmq"
modified = 2025-11-25T22:36:00.646Z
upstream = ["CVE-2022-2719"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2116537", "https://bugzilla.redhat.com/show_bug.cgi?id=2116537"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2022-2719"
imported = 2025-11-25T22:36:00.646Z
modified = 2024-11-21T07:01:34.720Z
published = 2022-08-10T20:15:36.917Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-2719"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-2719"
```

# In ImageMagick, a crafted file could trigger an assertion failure when a call to WriteImages was mad...

In ImageMagick, a crafted file could trigger an assertion failure when a call to WriteImages was made in MagickWand/operation.c, due to a NULL image list. This could potentially cause a denial of service. This was fixed in upstream ImageMagick version 7.1.0-30.

