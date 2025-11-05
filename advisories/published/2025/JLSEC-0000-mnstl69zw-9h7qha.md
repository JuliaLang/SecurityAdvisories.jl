```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl69zw-9h7qha"
modified = 2025-11-05T03:32:07.580Z
upstream = ["CVE-2023-46045"]
references = ["http://seclists.org/fulldisclosure/2024/Feb/24", "https://gitlab.com/graphviz/graphviz/-/issues/2441", "https://seclists.org/fulldisclosure/2024/Feb/24", "https://seclists.org/fulldisclosure/2024/Jan/73", "https://www.openwall.com/lists/oss-security/2024/02/01/2", "http://packetstormsecurity.com/files/176816/graphviz-2.43.0-Buffer-Overflow-Code-Execution.html", "http://seclists.org/fulldisclosure/2024/Feb/24", "http://seclists.org/fulldisclosure/2024/Jan/62", "http://seclists.org/fulldisclosure/2024/Jan/73", "https://gitlab.com/graphviz/graphviz/-/issues/2441", "https://seclists.org/fulldisclosure/2024/Feb/24", "https://seclists.org/fulldisclosure/2024/Jan/73", "https://www.openwall.com/lists/oss-security/2024/02/01/2"]

[[affected]]
pkg = "Graphviz_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-46045"
imported = 2025-11-05T03:32:07.580Z
modified = 2025-11-04T19:16:03.283Z
published = 2024-02-02T06:15:45.123Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-46045"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-46045"
```

# Graphviz 2.36.0 through 9.x before 10.0.1 has an out-of-bounds read via a crafted config6a file

Graphviz 2.36.0 through 9.x before 10.0.1 has an out-of-bounds read via a crafted config6a file. NOTE: exploitability may be uncommon because this file is typically owned by root.

