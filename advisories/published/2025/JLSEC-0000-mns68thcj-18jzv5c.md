```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns68thcj-18jzv5c"
modified = 2025-10-19T19:27:33.139Z
upstream = ["CVE-2023-47039"]
references = ["https://access.redhat.com/security/cve/CVE-2023-47039", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1056746", "https://bugzilla.redhat.com/show_bug.cgi?id=2249525", "https://access.redhat.com/security/cve/CVE-2023-47039", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1056746", "https://bugzilla.redhat.com/show_bug.cgi?id=2249525", "https://perldoc.perl.org/perl5382delta#CVE-2023-47039-Perl-for-Windows-binary-hijacking-vulnerability", "https://security.netapp.com/advisory/ntap-20240208-0005/"]

[[affected]]
pkg = "Perl_jll"
ranges = ["< 5.34.0+0"]

[[jlsec_sources]]
id = "CVE-2023-47039"
imported = 2025-10-19T19:27:33.139Z
modified = 2024-11-21T08:29:39.083Z
published = 2024-01-02T06:15:13.737Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-47039"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-47039"
```

# A vulnerability was found in Perl

A vulnerability was found in Perl. This security issue occurs while Perl for Windows relies on the system path environment variable to find the shell (`cmd.exe`). When running an executable that uses the Windows Perl interpreter, Perl attempts to find and execute `cmd.exe` within the operating system. However, due to path search order issues, Perl initially looks for cmd.exe in the current working directory. This flaw allows an attacker with limited privileges to place`cmd.exe` in locations with weak permissions, such as `C:\ProgramData`. By doing so, arbitrary code can be executed when an administrator attempts to use this executable from these compromised locations.

