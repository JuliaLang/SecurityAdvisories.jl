```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8u7yjp-erva86"
modified = 2025-10-21T15:02:12.901Z
upstream = ["CVE-2023-25193"]
references = ["https://chromium.googlesource.com/chromium/src/+/e1f324aa681af54101c1f2d173d92adb80e37088/DEPS#361", "https://github.com/harfbuzz/harfbuzz/blob/2822b589bc837fae6f66233e2cf2eef0f6ce8470/src/hb-ot-layout-gsubgpos.hh", "https://github.com/harfbuzz/harfbuzz/commit/85be877925ddbf34f74a1229f3ca1716bb6170dc", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KWCHWSICWVZSAXP2YAXM65JC2GR53547/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YZ5M2GSAIHFPLHYJXUPQ2QDJCLWXUGO3/", "https://security.netapp.com/advisory/ntap-20230725-0006/", "https://chromium.googlesource.com/chromium/src/+/e1f324aa681af54101c1f2d173d92adb80e37088/DEPS#361", "https://github.com/harfbuzz/harfbuzz/blob/2822b589bc837fae6f66233e2cf2eef0f6ce8470/src/hb-ot-layout-gsubgpos.hh", "https://github.com/harfbuzz/harfbuzz/commit/85be877925ddbf34f74a1229f3ca1716bb6170dc", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KWCHWSICWVZSAXP2YAXM65JC2GR53547/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YZ5M2GSAIHFPLHYJXUPQ2QDJCLWXUGO3/", "https://security.netapp.com/advisory/ntap-20230725-0006/"]

[[affected]]
pkg = "HarfBuzz_jll"
ranges = ["< 8.3.1+0"]
[[affected]]
pkg = "HarfBuzz_ICU_jll"
ranges = ["< 8.5.0+0"]

[[jlsec_sources]]
id = "CVE-2023-25193"
imported = 2025-10-21T15:02:12.901Z
modified = 2025-03-25T21:15:41.240Z
published = 2023-02-04T20:15:08.027Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-25193"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-25193"
```

# hb-ot-layout-gsubgpos.hh in HarfBuzz through 6.0.0 allows attackers to trigger O(n^2) growth via con...

hb-ot-layout-gsubgpos.hh in HarfBuzz through 6.0.0 allows attackers to trigger O(n^2) growth via consecutive marks during the process of looking back for base glyphs when attaching marks.

