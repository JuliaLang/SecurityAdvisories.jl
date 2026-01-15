```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvn1xfpo-yan8oi"
modified = 2026-01-15T03:45:52.332Z
upstream = ["CVE-2026-22184"]
references = ["https://github.com/madler/zlib", "https://seclists.org/fulldisclosure/2026/Jan/3", "https://www.vulncheck.com/advisories/zlib-untgz-global-buffer-overflow-in-tgzfname", "https://zlib.net/", "https://github.com/madler/zlib/issues/1142"]

[[affected]]
pkg = "Zlib_jll"
ranges = ["*"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["*"]
[[affected]]
pkg = "GCCBootstrap_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2026-22184"
imported = 2026-01-15T03:45:52.332Z
modified = 2026-01-14T20:24:05.723Z
published = 2026-01-07T21:16:01.563Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-22184"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-22184"
```

# zlib versions up to and including 1.3.1.2 contain a global buffer overflow in the untgz utility

zlib versions up to and including 1.3.1.2 contain a global buffer overflow in the untgz utility. The TGZfname() function copies an attacker-supplied archive name from argv[] into a fixed-size 1024-byte static global buffer using an unbounded strcpy() call without length validation. Supplying an archive name longer than 1024 bytes results in an out-of-bounds write that can lead to memory corruption, denial of service, and potentially code execution depending on compiler, build flags, architecture, and memory layout. The overflow occurs prior to any archive parsing or validation.

