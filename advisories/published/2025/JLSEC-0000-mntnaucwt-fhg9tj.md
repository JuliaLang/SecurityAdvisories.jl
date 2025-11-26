```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucwt-fhg9tj"
modified = 2025-11-25T22:36:00.605Z
upstream = ["CVE-2020-25667"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1891613", "https://bugzilla.redhat.com/show_bug.cgi?id=1891613"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-25667"
imported = 2025-11-25T22:36:00.605Z
modified = 2024-11-21T05:18:24.373Z
published = 2020-12-08T21:15:12.700Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-25667"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-25667"
```

# TIFFGetProfiles() in /coders/tiff.c calls strstr() which causes a large out-of-bounds read when it s...

TIFFGetProfiles() in /coders/tiff.c calls strstr() which causes a large out-of-bounds read when it searches for `"dc:format=\"image/dng\"` within `profile` due to improper string handling, when a crafted input file is provided to ImageMagick. The patch uses a StringInfo type instead of a raw C string to remedy this. This could cause an impact to availability of the application. This flaw affects ImageMagick versions prior to 7.0.9-0.

