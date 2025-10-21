```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8u9o7c-1nskhws"
modified = 2025-10-21T15:03:32.808Z
upstream = ["CVE-2021-46822"]
references = ["https://exchange.xforce.ibmcloud.com/vulnerabilities/221567", "https://github.com/libjpeg-turbo/libjpeg-turbo/commit/f35fd27ec641c42d6b115bfa595e483ec58188d2", "https://exchange.xforce.ibmcloud.com/vulnerabilities/221567", "https://github.com/libjpeg-turbo/libjpeg-turbo/commit/f35fd27ec641c42d6b115bfa595e483ec58188d2"]

[[affected]]
pkg = "JpegTurbo_jll"
ranges = ["< 2.1.0+0"]

[[jlsec_sources]]
id = "CVE-2021-46822"
imported = 2025-10-21T15:03:32.808Z
modified = 2024-11-21T06:34:45.830Z
published = 2022-06-18T16:15:08.110Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-46822"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-46822"
```

# The PPM reader in libjpeg-turbo through 2.0.90 mishandles use of tjLoadImage for loading a 16-bit bi...

The PPM reader in libjpeg-turbo through 2.0.90 mishandles use of tjLoadImage for loading a 16-bit binary PPM file into a grayscale buffer and loading a 16-bit binary PGM file into an RGB buffer. This is related to a heap-based buffer overflow in the get_word_rgb_row function in rdppm.c.

