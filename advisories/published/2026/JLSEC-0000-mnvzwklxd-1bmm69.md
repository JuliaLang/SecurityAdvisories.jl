```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvzwklxd-1bmm69"
modified = 2026-01-24T03:36:56.065Z
upstream = ["CVE-2025-2913"]
references = ["https://github.com/HDFGroup/hdf5/issues/5376", "https://vuldb.com/?ctiid.301886", "https://vuldb.com/?id.301886", "https://vuldb.com/?submit.520404"]

[[affected]]
pkg = "HDF5_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-2913"
imported = 2026-01-24T03:36:56.065Z
modified = 2026-01-23T20:51:23.010Z
published = 2025-03-28T17:15:30.260Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-2913"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-2913"
```

# A vulnerability was found in HDF5 up to 1.14.6

A vulnerability was found in HDF5 up to 1.14.6. It has been rated as critical. Affected by this issue is the function H5FL__blk_gc_list of the file src/H5FL.c. The manipulation of the argument H5FL_blk_head_t leads to use after free. An attack has to be approached locally. The exploit has been disclosed to the public and may be used.

