```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntz107vk-ovl6tf"
modified = 2025-12-04T03:33:51.968Z
upstream = ["CVE-2021-20232"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1922275", "https://lists.apache.org/thread.html/r50661d6f0082709aad9a584431b59ec364f9974b63b07e0800230168%40%3Cissues.spark.apache.org%3E", "https://lists.apache.org/thread.html/r5d4001031e7790d8c6396c499522b4ed2aab782da87b1a14184793bb%40%3Cissues.spark.apache.org%3E", "https://lists.apache.org/thread.html/r5f88bed447742fcc5c47bf1c7be965ef450131914a6e1f85feba2779%40%3Cissues.spark.apache.org%3E", "https://lists.apache.org/thread.html/r6ac143ba6dd98bd4bf6bf010d46e56e254056459721ba18822d611f7%40%3Cissues.spark.apache.org%3E", "https://lists.apache.org/thread.html/r9cbc69e57276413788e90a6ee16c7c034ea4258d31935b70db2bd158%40%3Cissues.spark.apache.org%3E", "https://lists.apache.org/thread.html/rcd70a4c88a47a75fd2d5f3ffb7cee8c2a18c713320bd90fdcb57495f%40%3Cissues.spark.apache.org%3E", "https://lists.apache.org/thread.html/rf5e1256d870193def4a82ad89ab95e63943a313b5ff0d81aa87e4532%40%3Cissues.spark.apache.org%3E", "https://lists.apache.org/thread.html/rfd5273d72d244178441e6904a2f2b41a3268f569e8092ea0b3b2bb20%40%3Cissues.spark.apache.org%3E", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OSLAE6PP33A7VYRYMYMUVB3U6B26GZER/", "https://security.netapp.com/advisory/ntap-20210416-0005/", "https://www.gnutls.org/security-new.html#GNUTLS-SA-2021-03-10", "https://bugzilla.redhat.com/show_bug.cgi?id=1922275", "https://lists.apache.org/thread.html/r50661d6f0082709aad9a584431b59ec364f9974b63b07e0800230168%40%3Cissues.spark.apache.org%3E", "https://lists.apache.org/thread.html/r5d4001031e7790d8c6396c499522b4ed2aab782da87b1a14184793bb%40%3Cissues.spark.apache.org%3E", "https://lists.apache.org/thread.html/r5f88bed447742fcc5c47bf1c7be965ef450131914a6e1f85feba2779%40%3Cissues.spark.apache.org%3E", "https://lists.apache.org/thread.html/r6ac143ba6dd98bd4bf6bf010d46e56e254056459721ba18822d611f7%40%3Cissues.spark.apache.org%3E", "https://lists.apache.org/thread.html/r9cbc69e57276413788e90a6ee16c7c034ea4258d31935b70db2bd158%40%3Cissues.spark.apache.org%3E", "https://lists.apache.org/thread.html/rcd70a4c88a47a75fd2d5f3ffb7cee8c2a18c713320bd90fdcb57495f%40%3Cissues.spark.apache.org%3E", "https://lists.apache.org/thread.html/rf5e1256d870193def4a82ad89ab95e63943a313b5ff0d81aa87e4532%40%3Cissues.spark.apache.org%3E", "https://lists.apache.org/thread.html/rfd5273d72d244178441e6904a2f2b41a3268f569e8092ea0b3b2bb20%40%3Cissues.spark.apache.org%3E", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OSLAE6PP33A7VYRYMYMUVB3U6B26GZER/", "https://security.netapp.com/advisory/ntap-20210416-0005/", "https://www.gnutls.org/security-new.html#GNUTLS-SA-2021-03-10"]

[[affected]]
pkg = "GnuTLS_jll"
ranges = ["< 3.7.1+0"]

[[jlsec_sources]]
id = "CVE-2021-20232"
imported = 2025-12-04T03:33:51.968Z
modified = 2025-12-03T15:15:48.943Z
published = 2021-03-12T19:15:13.130Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-20232"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-20232"
```

# A flaw was found in gnutls

A flaw was found in gnutls. A use after free issue in client_send_params in lib/ext/pre_shared_key.c may lead to memory corruption and other potential consequences.

