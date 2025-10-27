```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnshg8yuc-88mdfs"
modified = 2025-10-27T15:41:00.900Z
upstream = ["CVE-2022-0563"]
references = ["https://lore.kernel.org/util-linux/20220214110609.msiwlm457ngoic6w%40ws.net.home/T/#u", "https://security.gentoo.org/glsa/202401-08", "https://security.netapp.com/advisory/ntap-20220331-0002/", "https://lore.kernel.org/util-linux/20220214110609.msiwlm457ngoic6w%40ws.net.home/T/#u", "https://security.gentoo.org/glsa/202401-08", "https://security.netapp.com/advisory/ntap-20220331-0002/"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]
[[affected]]
pkg = "Libuuid_jll"
ranges = ["< 2.39.3+0"]
[[affected]]
pkg = "Libmount_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2022-0563"
imported = 2025-10-27T15:41:00.900Z
modified = 2025-06-09T16:15:33.237Z
published = 2022-02-21T19:15:08.393Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-0563"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-0563"
```

# A flaw was found in the util-linux chfn and chsh utilities when compiled with Readline support

A flaw was found in the util-linux chfn and chsh utilities when compiled with Readline support. The Readline library uses an "INPUTRC" environment variable to get a path to the library config file. When the library cannot parse the specified file, it prints an error message containing data from the file. This flaw allows an unprivileged user to read root-owned files, potentially leading to privilege escalation. This flaw affects util-linux versions prior to 2.37.4.

