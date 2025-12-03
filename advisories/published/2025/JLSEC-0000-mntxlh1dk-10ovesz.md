```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntxlh1dk-10ovesz"
modified = 2025-12-03T03:31:16.664Z
upstream = ["CVE-2022-4904"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2168631", "https://github.com/c-ares/c-ares/issues/496", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/33LDNS6RPOPP36Z4MPWXALUQZXJCWJS2/", "https://security.gentoo.org/glsa/202401-02", "https://bugzilla.redhat.com/show_bug.cgi?id=2168631", "https://github.com/c-ares/c-ares/issues/496", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/33LDNS6RPOPP36Z4MPWXALUQZXJCWJS2/", "https://security.gentoo.org/glsa/202401-02"]

[[affected]]
pkg = "Cares_jll"
ranges = ["< 1.32.2+0"]

[[jlsec_sources]]
id = "CVE-2022-4904"
imported = 2025-12-03T03:31:16.664Z
modified = 2025-12-02T21:15:50.887Z
published = 2023-03-06T23:15:11.390Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-4904"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-4904"
```

# A flaw was found in the c-ares package

A flaw was found in the c-ares package. The ares_set_sortlist is missing checks about the validity of the input string, which allows a possible arbitrary length stack overflow. This issue may cause a denial of service or a limited impact on confidentiality and integrity.

