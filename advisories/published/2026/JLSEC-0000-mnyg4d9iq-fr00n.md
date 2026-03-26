```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d9iq-fr00n"
modified = 2026-03-26T21:18:53.810Z
upstream = ["CVE-2011-5000"]
references = ["http://rhn.redhat.com/errata/RHSA-2012-0884.html", "http://seclists.org/fulldisclosure/2011/Aug/2", "http://site.pi3.com.pl/adv/ssh_1.txt", "http://rhn.redhat.com/errata/RHSA-2012-0884.html", "http://seclists.org/fulldisclosure/2011/Aug/2", "http://site.pi3.com.pl/adv/ssh_1.txt"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2011-5000"
imported = 2026-03-26T21:18:53.810Z
modified = 2025-04-11T00:51:21.963Z
published = 2012-04-05T14:55:03.590Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2011-5000"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2011-5000"
```

# The ssh_gssapi_parse_ename function in gss-serv.c in OpenSSH 5.8 and earlier, when gssapi-with-mic a...

The ssh_gssapi_parse_ename function in gss-serv.c in OpenSSH 5.8 and earlier, when gssapi-with-mic authentication is enabled, allows remote authenticated users to cause a denial of service (memory consumption) via a large value in a certain length field.  NOTE: there may be limited scenarios in which this issue is relevant.

