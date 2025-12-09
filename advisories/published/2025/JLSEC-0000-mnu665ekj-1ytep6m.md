```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnu665ekj-1ytep6m"
modified = 2025-12-09T03:32:15.235Z
upstream = ["CVE-2025-64183"]
references = ["https://github.com/AcademySoftwareFoundation/openexr/blob/b3a19903db0672c63055023aa788e592b16ec3c5/src/wrappers/python/PyOpenEXR_old.cpp#L109-L115", "https://github.com/AcademySoftwareFoundation/openexr/security/advisories/GHSA-57cw-j6vp-2p9m", "https://github.com/AcademySoftwareFoundation/openexr/security/advisories/GHSA-57cw-j6vp-2p9m"]

[[affected]]
pkg = "OpenEXR_jll"
ranges = [">= 3.1.4+0"]

[[jlsec_sources]]
id = "CVE-2025-64183"
imported = 2025-12-09T03:32:15.235Z
modified = 2025-12-08T16:00:58.283Z
published = 2025-11-10T22:15:37.323Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-64183"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-64183"
```

# OpenEXR provides the specification and reference implementation of the EXR file format, an image sto...

OpenEXR provides the specification and reference implementation of the EXR file format, an image storage format for the motion picture industry. In versions 3.2.0 through 3.2.4, 3.3.0 through 3.3.5, and 3.4.0 through 3.4.2, there is a use-after-free in PyObject_StealAttrString of pyOpenEXR_old.cpp. The legacy adapter defines PyObject_StealAttrString that calls PyObject_GetAttrString to obtain a new reference, immediately decrefs it, and returns the pointer. Callers then pass this dangling pointer to APIs like PyLong_AsLong/PyFloat_AsDouble, resulting in a use-after-free. This is invoked in multiple places (e.g., reading PixelType.v, Box2i, V2f, etc.) Versions 3.2.5, 3.3.6, and 3.4.3 fix the issue.

