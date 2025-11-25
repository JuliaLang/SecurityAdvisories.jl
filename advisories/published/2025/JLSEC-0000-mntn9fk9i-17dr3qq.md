```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntn9fk9i-17dr3qq"
modified = 2025-11-25T21:56:30.678Z
upstream = ["CVE-2025-9165"]
references = ["http://www.libtiff.org/", "https://drive.google.com/file/d/1FWhmkzksH8-qU0ZM6seBzGNB3aPnX3G8/view?usp=sharing", "https://gitlab.com/libtiff/libtiff/-/commit/ed141286a37f6e5ddafb5069347ff5d587e7a4e0", "https://gitlab.com/libtiff/libtiff/-/issues/728", "https://gitlab.com/libtiff/libtiff/-/merge_requests/747", "https://vuldb.com/?ctiid.320543", "https://vuldb.com/?id.320543", "https://vuldb.com/?submit.630506", "https://vuldb.com/?submit.630507", "https://gitlab.com/libtiff/libtiff/-/issues/728#note_2709263214"]

[[affected]]
pkg = "Libtiff_jll"
ranges = [">= 4.7.0+0, < 4.7.2+0"]

[[jlsec_sources]]
id = "CVE-2025-9165"
imported = 2025-11-25T21:56:30.678Z
modified = 2025-10-01T16:15:53.417Z
published = 2025-08-19T20:15:37.557Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-9165"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-9165"
```

# A flaw has been found in LibTIFF 4.7.0

A flaw has been found in LibTIFF 4.7.0. This affects the function _TIFFmallocExt/_TIFFCheckRealloc/TIFFHashSetNew/InitCCITTFax3 of the file tools/tiffcmp.c of the component tiffcmp. Executing manipulation can lead to memory leak. The attack is restricted to local execution. This attack is characterized by high complexity. It is indicated that the exploitability is difficult. The exploit has been published and may be used. There is ongoing doubt regarding the real existence of this vulnerability. This patch is called ed141286a37f6e5ddafb5069347ff5d587e7a4e0. It is best practice to apply a patch to resolve this issue. A researcher disputes the security impact of this issue, because "this is a memory leak on a command line tool that is about to exit anyway". In the reply the project maintainer declares this issue as "a simple 'bug' when leaving the command line tool and (...) not a security issue at all".

