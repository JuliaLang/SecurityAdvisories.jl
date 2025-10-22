```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6umn-1996mqs"
modified = 2025-10-21T17:21:19.247Z
upstream = ["CVE-2015-5218"]
references = ["http://lists.opensuse.org/opensuse-updates/2015-11/msg00035.html", "http://www.spinics.net/lists/util-linux-ng/msg11873.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1259322", "https://github.com/kerolasa/lelux-utiliteetit/commit/70e3fcf293c1827a2655a86584ab13075124a8a8", "https://github.com/kerolasa/lelux-utiliteetit/commit/d883d64d96ab9bef510745d064a351145b9babec", "https://www.kernel.org/pub/linux/utils/util-linux/v2.27/v2.27-ReleaseNotes", "http://lists.opensuse.org/opensuse-updates/2015-11/msg00035.html", "http://www.spinics.net/lists/util-linux-ng/msg11873.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1259322", "https://github.com/kerolasa/lelux-utiliteetit/commit/70e3fcf293c1827a2655a86584ab13075124a8a8", "https://github.com/kerolasa/lelux-utiliteetit/commit/d883d64d96ab9bef510745d064a351145b9babec", "https://www.kernel.org/pub/linux/utils/util-linux/v2.27/v2.27-ReleaseNotes"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2015-5218"
imported = 2025-10-21T17:21:19.247Z
modified = 2025-04-12T10:46:40.837Z
published = 2015-11-09T16:59:06.747Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-5218"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-5218"
```

# Buffer overflow in text-utils/colcrt.c in colcrt in util-linux before 2.27 allows local users to cau...

Buffer overflow in text-utils/colcrt.c in colcrt in util-linux before 2.27 allows local users to cause a denial of service (crash) via a crafted file, related to the page global variable.

