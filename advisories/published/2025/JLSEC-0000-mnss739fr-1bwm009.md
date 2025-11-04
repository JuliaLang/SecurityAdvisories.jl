```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss739fr-1bwm009"
modified = 2025-11-04T04:10:06.087Z
upstream = ["CVE-2025-24855"]
references = ["https://gitlab.gnome.org/GNOME/libxslt/-/issues/128", "https://lists.debian.org/debian-lts-announce/2025/03/msg00015.html"]

[[affected]]
pkg = "XSLT_jll"
ranges = ["< 1.1.43+0"]

[[jlsec_sources]]
id = "CVE-2025-24855"
imported = 2025-11-04T04:10:06.087Z
modified = 2025-11-03T22:18:40.750Z
published = 2025-03-14T02:15:15.717Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-24855"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-24855"
```

# numbers.c in libxslt before 1.1.43 has a use-after-free because, in nested XPath evaluations, an XPa...

numbers.c in libxslt before 1.1.43 has a use-after-free because, in nested XPath evaluations, an XPath context node can be modified but never restored. This is related to xsltNumberFormatGetValue, xsltEvalXPathPredicate, xsltEvalXPathStringNs, and xsltComputeSortResultInternal.

