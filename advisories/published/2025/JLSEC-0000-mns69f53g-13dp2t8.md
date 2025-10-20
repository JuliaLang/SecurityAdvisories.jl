```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns69f53g-13dp2t8"
modified = 2025-10-19T19:44:23.692Z
upstream = ["CVE-2022-25309"]
references = ["https://access.redhat.com/security/cve/CVE-2022-25309", "https://bugzilla.redhat.com/show_bug.cgi?id=2047896", "https://github.com/fribidi/fribidi/commit/f22593b82b5d1668d1997dbccd10a9c31ffea3b3", "https://github.com/fribidi/fribidi/issues/182", "https://access.redhat.com/security/cve/CVE-2022-25309", "https://bugzilla.redhat.com/show_bug.cgi?id=2047896", "https://github.com/fribidi/fribidi/commit/f22593b82b5d1668d1997dbccd10a9c31ffea3b3", "https://github.com/fribidi/fribidi/issues/182"]

[[affected]]
pkg = "FriBidi_jll"
ranges = ["< 1.0.14+0"]

[[jlsec_sources]]
id = "CVE-2022-25309"
imported = 2025-10-19T19:44:23.692Z
modified = 2024-11-21T06:51:58.233Z
published = 2022-09-06T18:15:11.493Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-25309"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-25309"
```

# A heap-based buffer overflow flaw was found in the Fribidi package and affects the fribidi_cap_rtl_t...

A heap-based buffer overflow flaw was found in the Fribidi package and affects the fribidi_cap_rtl_to_unicode() function of the fribidi-char-sets-cap-rtl.c file. This flaw allows an attacker to pass a specially crafted file to the Fribidi application with the '--caprtl' option, leading to a crash and causing a denial of service.

