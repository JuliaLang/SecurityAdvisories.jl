```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucx3-1gu5y5l"
modified = 2025-11-25T22:36:00.615Z
upstream = ["CVE-2020-27754"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894231", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1894231", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27754"
imported = 2025-11-25T22:36:00.615Z
modified = 2024-11-21T05:21:45.990Z
published = 2020-12-08T22:15:18.227Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27754"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27754"
```

# In IntensityCompare() of /magick/quantize.c, there are calls to PixelPacketIntensity() which could r...

In IntensityCompare() of /magick/quantize.c, there are calls to PixelPacketIntensity() which could return overflowed values to the caller when ImageMagick processes a crafted input file. To mitigate this, the patch introduces and uses the ConstrainPixelIntensity() function, which forces the pixel intensities to be within the proper bounds in the event of an overflow. This flaw affects ImageMagick versions prior to 6.9.10-69 and 7.0.8-69.

