```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5j9de-ebh2so"
modified = 2025-11-04T03:26:33.266Z
upstream = ["CVE-2023-2976"]
references = ["https://github.com/google/guava/issues/2575", "https://security.netapp.com/advisory/ntap-20230818-0008/", "https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01006.html", "https://github.com/google/guava/issues/2575", "https://security.netapp.com/advisory/ntap-20230818-0008/", "https://security.netapp.com/advisory/ntap-20241108-0002/", "https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01006.html"]

[[affected]]
pkg = "GAP_pkg_guava_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-2976"
imported = 2025-11-04T03:26:33.266Z
modified = 2025-11-03T22:16:08.973Z
published = 2023-06-14T18:15:09.513Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-2976"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-2976"
```

# Use of Java's default temporary directory for file creation in `FileBackedOutputStream` in Google Gu...

Use of Java's default temporary directory for file creation in `FileBackedOutputStream` in Google Guava versions 1.0 to 31.1 on Unix systems and Android Ice Cream Sandwich allows other users and apps on the machine with access to the default Java temporary directory to be able to access the files created by the class.

Even though the security vulnerability is fixed in version 32.0.0, we recommend using version 32.0.1 as version 32.0.0 breaks some functionality under Windows.

