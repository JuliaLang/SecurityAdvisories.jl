```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucx1-vuu4wt"
modified = 2025-11-25T22:36:00.613Z
upstream = ["CVE-2020-27753"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894229", "https://bugzilla.redhat.com/show_bug.cgi?id=1894229"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27753"
imported = 2025-11-25T22:36:00.613Z
modified = 2024-11-21T05:21:45.867Z
published = 2020-12-08T22:15:18.133Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27753"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27753"
```

# There are several memory leaks in the MIFF coder in /coders/miff.c due to improper image depth value...

There are several memory leaks in the MIFF coder in /coders/miff.c due to improper image depth values, which can be triggered by a specially crafted input file. These leaks could potentially lead to an impact to application availability or cause a denial of service. It was originally reported that the issues were in `AcquireMagickMemory()` because that is where LeakSanitizer detected the leaks, but the patch resolves issues in the MIFF coder, which incorrectly handles data being passed to `AcquireMagickMemory()`. This flaw affects ImageMagick versions prior to 7.0.9-0.

