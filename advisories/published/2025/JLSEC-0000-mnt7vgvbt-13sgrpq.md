```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnt7vgvbt-13sgrpq"
modified = 2025-11-15T03:29:04.409Z
upstream = ["CVE-2025-62689"]
references = ["https://git.gnunet.org/libmicrohttpd.git/commit/?id=ff13abc1c1d7d2b30d69d5c0bd4a237e1801c50b", "https://jvn.jp/en/jp/JVN76719218/", "https://www.gnu.org/software/libmicrohttpd/"]

[[affected]]
pkg = "libmicrohttpd_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-62689"
imported = 2025-11-15T03:29:04.409Z
modified = 2025-11-14T18:05:06.277Z
published = 2025-11-10T05:15:49.087Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-62689"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-62689"
```

# NULL pointer dereference vulnerability exists in GNU libmicrohttpd v1.0.2 and earlier

NULL pointer dereference vulnerability exists in GNU libmicrohttpd v1.0.2 and earlier. The vulnerability was fixed in commit ff13abc on the master branch of the libmicrohttpd Git repository, after the v1.0.2 tag. A specially crafted packet sent by an attacker could cause a denial-of-service (DoS) condition.

