```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss62o7p-2ujnk1"
modified = 2025-11-04T03:41:38.965Z
upstream = ["CVE-2024-3447"]
references = ["https://access.redhat.com/security/cve/CVE-2024-3447", "https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=58813", "https://bugzilla.redhat.com/show_bug.cgi?id=2274123", "https://patchew.org/QEMU/20240404085549.16987-1-philmd@linaro.org/", "https://lists.debian.org/debian-lts-announce/2025/04/msg00042.html", "https://security.netapp.com/advisory/ntap-20250425-0005/"]

[[affected]]
pkg = "Qemu_jll"
ranges = ["*"]
[[affected]]
pkg = "Qemu_static_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-3447"
imported = 2025-11-04T03:41:38.965Z
modified = 2025-11-03T20:16:26.963Z
published = 2024-11-14T12:15:17.743Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-3447"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-3447"
```

# A heap-based buffer overflow was found in the SDHCI device emulation of QEMU

A heap-based buffer overflow was found in the SDHCI device emulation of QEMU. The bug is triggered when both `s->data_count` and the size of  `s->fifo_buffer` are set to 0x200, leading to an out-of-bound access. A malicious guest could use this flaw to crash the QEMU process on the host, resulting in a denial of service condition.

