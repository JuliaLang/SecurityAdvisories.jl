```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw9x3jrs-1ergali"
modified = 2026-01-31T03:49:21.496Z
upstream = ["CVE-2026-24515"]
references = ["https://github.com/libexpat/libexpat/pull/1131"]

[[affected]]
pkg = "Expat_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2026-24515"
imported = 2026-01-31T03:49:21.496Z
modified = 2026-01-30T17:54:41.927Z
published = 2026-01-23T08:16:01.490Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-24515"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-24515"
```

# In libexpat before 2.7.4, XML_ExternalEntityParserCreate does not copy unknown encoding handler user...

In libexpat before 2.7.4, XML_ExternalEntityParserCreate does not copy unknown encoding handler user data.

