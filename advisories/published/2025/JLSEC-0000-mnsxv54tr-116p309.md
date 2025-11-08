```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnsxv54tr-116p309"
modified = 2025-11-08T03:22:15.087Z
upstream = ["CVE-2025-2915"]
references = ["https://github.com/HDFGroup/hdf5/issues/5380", "https://vuldb.com/?ctiid.301888", "https://vuldb.com/?id.301888", "https://vuldb.com/?submit.520899", "https://github.com/HDFGroup/hdf5/issues/5380"]

[[affected]]
pkg = "HDF5_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-2915"
imported = 2025-11-08T03:22:15.087Z
modified = 2025-11-07T16:16:35.980Z
published = 2025-03-28T17:15:30.750Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-2915"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-2915"
```

# A vulnerability classified as problematic was found in HDF5 up to 1.14.6

A vulnerability classified as problematic was found in HDF5 up to 1.14.6. This vulnerability affects the function H5F__accum_free of the file src/H5Faccum.c. The manipulation of the argument overlap_size leads to heap-based buffer overflow. Attacking locally is a requirement. The exploit has been disclosed to the public and may be used.

