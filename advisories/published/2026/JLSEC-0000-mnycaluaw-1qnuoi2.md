```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnycaluaw-1qnuoi2"
modified = 2026-03-24T05:02:26.984Z
upstream = ["CVE-2025-28162"]
references = ["https://gist.github.com/kittener/fbfdb9b5610c6b3db0d5dea045a07c60", "https://github.com/pnggroup/libpng/issues/656"]

[[affected]]
pkg = "libpng_jll"
ranges = [">= 1.6.43+0, < 1.6.47+0"]

[[jlsec_sources]]
id = "CVE-2025-28162"
imported = 2026-03-24T05:02:26.984Z
modified = 2026-02-06T20:06:44.260Z
published = 2026-01-27T16:16:14.630Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-28162"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-28162"
```

# Buffer Overflow vulnerability in libpng 1.6.43-1.6.46 allows a local attacker to cause a denial of s...

Buffer Overflow vulnerability in libpng 1.6.43-1.6.46 allows a local attacker to cause a denial of service via the pngimage with AddressSanitizer (ASan), the program leaks memory in various locations, eventually leading to high memory usage and causing the program to become unresponsive

