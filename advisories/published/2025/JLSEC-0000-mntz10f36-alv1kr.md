```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntz10f36-alv1kr"
modified = 2025-12-04T03:34:01.314Z
upstream = ["CVE-2025-7394"]
references = ["https://github.com/wolfSSL/wolfssl/blob/master/ChangeLog.md#wolfssl-release-582-july-17-2025"]

[[affected]]
pkg = "wolfSSL_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-7394"
imported = 2025-12-04T03:34:01.314Z
modified = 2025-12-03T15:21:28.503Z
published = 2025-07-18T23:15:23.470Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-7394"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-7394"
```

# In the OpenSSL compatibility layer implementation, the function RAND_poll() was not behaving as expe...

In the OpenSSL compatibility layer implementation, the function RAND_poll() was not behaving as expected and leading to the potential for predictable values returned from RAND_bytes() after fork() is called. This can lead to weak or predictable random numbers generated in applications that are both using RAND_bytes() and doing fork() operations. This only affects applications explicitly calling RAND_bytes() after fork() and does not affect any internal TLS operations. Although RAND_bytes() documentation in OpenSSL calls out not being safe for use with fork() without first calling RAND_poll(), an additional code change was also made in wolfSSL to make RAND_bytes() behave similar to OpenSSL after a fork() call without calling RAND_poll(). Now the Hash-DRBG used gets reseeded after detecting running in a new process. If making use of RAND_bytes() and calling fork() we recommend updating to the latest version of wolfSSL. Thanks to Per Allansson from Appgate for the report.

