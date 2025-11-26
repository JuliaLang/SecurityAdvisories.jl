```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucwq-usk2ev"
modified = 2025-11-25T22:36:00.602Z
upstream = ["CVE-2020-25665"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1891606", "https://lists.debian.org/debian-lts-announce/2021/01/msg00010.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1891606", "https://lists.debian.org/debian-lts-announce/2021/01/msg00010.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-25665"
imported = 2025-11-25T22:36:00.602Z
modified = 2024-11-21T05:18:24.023Z
published = 2020-12-08T21:15:12.560Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-25665"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-25665"
```

# The PALM image coder at coders/palm.c makes an improper call to AcquireQuantumMemory() in routine Wr...

The PALM image coder at coders/palm.c makes an improper call to AcquireQuantumMemory() in routine WritePALMImage() because it needs to be offset by 256. This can cause a out-of-bounds read later on in the routine. The patch adds 256 to bytes_per_row in the call to AcquireQuantumMemory(). This could cause impact to reliability. This flaw affects ImageMagick versions prior to 7.0.8-68.

