```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5jil3-hl7eia"
modified = 2025-11-04T03:26:45.207Z
upstream = ["CVE-2023-30585"]
references = ["https://nodejs.org/en/blog/vulnerability/june-2023-security-releases", "https://nodejs.org/en/blog/vulnerability/june-2023-security-releases", "https://security.netapp.com/advisory/ntap-20241101-0011/"]

[[affected]]
pkg = "libnode_jll"
ranges = [">= 16.14.0+0"]

[[jlsec_sources]]
id = "CVE-2023-30585"
imported = 2025-11-04T03:26:45.207Z
modified = 2025-11-03T22:16:09.827Z
published = 2023-11-28T02:15:42.077Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-30585"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-30585"
```

# A vulnerability has been identified in the Node.js (.msi version) installation process, specifically...

A vulnerability has been identified in the Node.js (.msi version) installation process, specifically affecting Windows users who install Node.js using the .msi installer. This vulnerability emerges during the repair operation, where the "msiexec.exe" process, running under the NT AUTHORITY\SYSTEM context, attempts to read the %USERPROFILE% environment variable from the current user's registry.

The issue arises when the path referenced by the %USERPROFILE% environment variable does not exist. In such cases, the "msiexec.exe" process attempts to create the specified path in an unsafe manner, potentially leading to the creation of arbitrary folders in arbitrary locations.

The severity of this vulnerability is heightened by the fact that the %USERPROFILE% environment variable in the Windows registry can be modified by standard (or "non-privileged") users. Consequently, unprivileged actors, including malicious entities or trojans, can manipulate the environment variable key to deceive the privileged "msiexec.exe" process. This manipulation can result in the creation of folders in unintended and potentially malicious locations.

It is important to note that this vulnerability is specific to Windows users who install Node.js using the .msi installer. Users who opt for other installation methods are not affected by this particular issue.

