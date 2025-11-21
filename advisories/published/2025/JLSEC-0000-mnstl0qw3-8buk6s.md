```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl0qw3-8buk6s"
modified = 2025-11-05T03:27:49.539Z
upstream = ["CVE-2023-0215"]
references = ["https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=8818064ce3c3c0f1b740a5aaba2a987e75bfbafd", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=9816136fe31d92ace4037d5da5257f763aeeb4eb", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=c3829dd8825c654652201e16f8a0a0c46ee3f344", "https://security.gentoo.org/glsa/202402-08", "https://security.netapp.com/advisory/ntap-20230427-0007/", "https://security.netapp.com/advisory/ntap-20230427-0009/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://www.openssl.org/news/secadv/20230207.txt", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=8818064ce3c3c0f1b740a5aaba2a987e75bfbafd", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=9816136fe31d92ace4037d5da5257f763aeeb4eb", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=c3829dd8825c654652201e16f8a0a0c46ee3f344", "https://psirt.global.sonicwall.com/vuln-detail/SNWLID-2023-0003", "https://security.gentoo.org/glsa/202402-08", "https://security.netapp.com/advisory/ntap-20230427-0007/", "https://security.netapp.com/advisory/ntap-20230427-0009/", "https://security.netapp.com/advisory/ntap-20240621-0006/", "https://www.openssl.org/news/secadv/20230207.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.20+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.27.1+0"]

[[jlsec_sources]]
id = "CVE-2023-0215"
imported = 2025-11-05T03:27:49.539Z
modified = 2025-11-04T20:16:15.847Z
published = 2023-02-08T20:15:24.107Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-0215"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-0215"
```

# The public API function BIO_new_NDEF is a helper function used for streaming ASN.1 data via a BIO

The public API function BIO_new_NDEF is a helper function used for streaming
ASN.1 data via a BIO. It is primarily used internally to OpenSSL to support the
SMIME, CMS and PKCS7 streaming capabilities, but may also be called directly by
end user applications.

The function receives a BIO from the caller, prepends a new BIO_f_asn1 filter
BIO onto the front of it to form a BIO chain, and then returns the new head of
the BIO chain to the caller. Under certain conditions, for example if a CMS
recipient public key is invalid, the new filter BIO is freed and the function
returns a NULL result indicating a failure. However, in this case, the BIO chain
is not properly cleaned up and the BIO passed by the caller still retains
internal pointers to the previously freed filter BIO. If the caller then goes on
to call BIO_pop() on the BIO then a use-after-free will occur. This will most
likely result in a crash.

This scenario occurs directly in the internal function B64_write_ASN1() which
may cause BIO_new_NDEF() to be called and will subsequently call BIO_pop() on
the BIO. This internal function is in turn called by the public API functions
PEM_write_bio_ASN1_stream, PEM_write_bio_CMS_stream, PEM_write_bio_PKCS7_stream,
SMIME_write_ASN1, SMIME_write_CMS and SMIME_write_PKCS7.

Other public API functions that may be impacted by this include
i2d_ASN1_bio_stream, BIO_new_CMS, BIO_new_PKCS7, i2d_CMS_bio_stream and
i2d_PKCS7_bio_stream.

The OpenSSL cms and smime command line applications are similarly affected.

