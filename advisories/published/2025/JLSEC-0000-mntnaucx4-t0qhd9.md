```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucx4-t0qhd9"
modified = 2025-11-25T22:36:00.616Z
upstream = ["CVE-2020-27755"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894232", "https://bugzilla.redhat.com/show_bug.cgi?id=1894232"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27755"
imported = 2025-11-25T22:36:00.616Z
modified = 2024-11-21T05:21:46.120Z
published = 2020-12-08T22:15:18.290Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27755"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27755"
```

# in SetImageExtent() of /MagickCore/image.c, an incorrect image depth size can cause a memory leak be...

in SetImageExtent() of /MagickCore/image.c, an incorrect image depth size can cause a memory leak because the code which checks for the proper image depth size does not reset the size in the event there is an invalid size. The patch resets the depth to a proper size before throwing an exception. The memory leak can be triggered by a crafted input file that is processed by ImageMagick and could cause an impact to application reliability, such as denial of service. This flaw affects ImageMagick versions prior to 7.0.9-0.

