```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnshe6jqx-unw7vm"
modified = 2025-10-27T14:43:08.793Z
aliases = ["CVE-2023-46308"]
references = ["https://github.com/plotly/plotly.js/releases/tag/v2.25.2", "https://plotly.com/javascript/", "https://github.com/plotly/plotly.js/releases/tag/v2.25.2", "https://plotly.com/javascript/"]

[[jlsec_sources]]
id = "CVE-2023-46308"
imported = 2025-10-27T14:43:08.768Z
modified = 2025-06-03T15:15:42.150Z
published = 2024-01-03T05:15:11.360Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-46308"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-46308"
```

# In Plotly plotly.js before 2.25.2, plot API calls have a risk of __proto__ being polluted in expandO...

In Plotly plotly.js before 2.25.2, plot API calls have a risk of __proto__ being polluted in expandObjectPaths or nestedProperty.

