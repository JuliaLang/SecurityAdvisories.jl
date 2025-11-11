```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsb04uzl-1v0lsve"
modified = 2025-10-23T03:23:18.369Z
upstream = ["CVE-2025-24855"]
references = ["https://gitlab.gnome.org/GNOME/libxslt/-/issues/128"]

[[affected]]
pkg = "XSLT_jll"
ranges = ["< 1.1.43+0"]

[[jlsec_sources]]
id = "CVE-2025-24855"
imported = 2025-10-23T03:23:18.369Z
modified = 2025-10-22T19:09:07.097Z
published = 2025-03-14T02:15:15.717Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-24855"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-24855"
```

# numbers.c in libxslt before 1.1.43 has a use-after-free because, in nested XPath evaluations, an XPa...

numbers.c in libxslt before 1.1.43 has a use-after-free because, in nested XPath evaluations, an XPath context node can be modified but never restored. This is related to xsltNumberFormatGetValue, xsltEvalXPathPredicate, xsltEvalXPathStringNs, and xsltComputeSortResultInternal.

