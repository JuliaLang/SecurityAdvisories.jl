```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvoh1jls-17zey01"
modified = 2026-01-16T03:36:44.416Z
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
imported = 2026-01-16T03:36:44.416Z
modified = 2026-01-15T14:16:27.047Z
published = 2026-01-07T21:16:01.563Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-22184"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-22184"
```

# zlib versions up to and including 1.3.1.2 include a global buffer overflow in the untgz utility loca...

zlib versions up to and including 1.3.1.2 include a global buffer overflow in the untgz utility located under contrib/untgz. The vulnerability is limited to the standalone demonstration utility and does not affect the core zlib compression library. The flaw occurs when a user executes the untgz command with an excessively long archive name supplied via the command line, leading to an out-of-bounds write in a fixed-size global buffer.

