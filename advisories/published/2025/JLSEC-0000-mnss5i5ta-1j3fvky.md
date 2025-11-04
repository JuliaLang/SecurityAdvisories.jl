```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5i5ta-1j3fvky"
modified = 2025-11-04T03:25:41.998Z
upstream = ["CVE-2017-5950"]
references = ["http://www.securityfocus.com/bid/97307", "https://github.com/jbeder/yaml-cpp/issues/459", "http://seclists.org/fulldisclosure/2024/Nov/0", "http://www.securityfocus.com/bid/97307", "https://github.com/jbeder/yaml-cpp/issues/459"]

[[affected]]
pkg = "yaml_cpp_jll"
ranges = ["< 0.6.3+0"]

[[jlsec_sources]]
id = "CVE-2017-5950"
imported = 2025-11-04T03:25:41.980Z
modified = 2025-11-03T22:15:43.977Z
published = 2017-04-03T05:59:00.800Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-5950"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-5950"
```

# The SingleDocParser::HandleNode function in yaml-cpp (aka LibYaml-C++) 0.5.3 allows remote attackers...

The SingleDocParser::HandleNode function in yaml-cpp (aka LibYaml-C++) 0.5.3 allows remote attackers to cause a denial of service (stack consumption and application crash) via a crafted YAML file.

