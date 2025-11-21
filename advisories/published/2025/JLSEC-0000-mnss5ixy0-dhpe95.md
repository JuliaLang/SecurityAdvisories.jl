```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5ixy0-dhpe95"
modified = 2025-11-04T03:26:18.456Z
upstream = ["CVE-2022-42919"]
references = ["https://github.com/python/cpython/compare/v3.10.8...v3.10.9", "https://github.com/python/cpython/compare/v3.9.15...v3.9.16", "https://github.com/python/cpython/issues/97514", "https://github.com/python/cpython/issues/97514#issuecomment-1310277840", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FKGCQPIVHEAIJ77R3RSNSQWYBUDVWDKU/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/P2LHWWEI5OBQ6RELULMVU6KMDYG4WZXH/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/PI5DYIED6U26BGX5IRZWNCP6TY4M2ZGZ/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/QLUGZSEAO3MBWGKCUSMKQIRYJZKJCIOB/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/R6KGIRHSENZ4QAB234Z36HVIDTRJ3MFI/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RDK3ZZBRYFO47ET3N4BNTKVXN47U6ICY/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VCRKBB5Y5EWTJUNC7LK665WO64DDXSTN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/XX6LLAXGZVZ327REY6MDZRMMP47LJ53P/", "https://security.gentoo.org/glsa/202305-02", "https://security.netapp.com/advisory/ntap-20221209-0006/", "https://github.com/python/cpython/compare/v3.10.8...v3.10.9", "https://github.com/python/cpython/compare/v3.9.15...v3.9.16", "https://github.com/python/cpython/issues/97514", "https://github.com/python/cpython/issues/97514#issuecomment-1310277840", "https://lists.debian.org/debian-lts-announce/2024/12/msg00000.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FKGCQPIVHEAIJ77R3RSNSQWYBUDVWDKU/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/P2LHWWEI5OBQ6RELULMVU6KMDYG4WZXH/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/PI5DYIED6U26BGX5IRZWNCP6TY4M2ZGZ/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/QLUGZSEAO3MBWGKCUSMKQIRYJZKJCIOB/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/R6KGIRHSENZ4QAB234Z36HVIDTRJ3MFI/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RDK3ZZBRYFO47ET3N4BNTKVXN47U6ICY/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VCRKBB5Y5EWTJUNC7LK665WO64DDXSTN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/XX6LLAXGZVZ327REY6MDZRMMP47LJ53P/", "https://security.gentoo.org/glsa/202305-02", "https://security.netapp.com/advisory/ntap-20221209-0006/"]

[[affected]]
pkg = "Python_jll"
ranges = [">= 3.8.8+0, < 3.10.13+0"]

[[jlsec_sources]]
id = "CVE-2022-42919"
imported = 2025-11-04T03:26:18.456Z
modified = 2025-11-03T22:16:00.810Z
published = 2022-11-07T00:15:09.697Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-42919"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-42919"
```

# Python 3.9.x before 3.9.16 and 3.10.x before 3.10.9 on Linux allows local privilege escalation in a ...

Python 3.9.x before 3.9.16 and 3.10.x before 3.10.9 on Linux allows local privilege escalation in a non-default configuration. The Python multiprocessing library, when used with the forkserver start method on Linux, allows pickles to be deserialized from any user in the same machine local network namespace, which in many system configurations means any user on the same machine. Pickles can execute arbitrary code. Thus, this allows for local user privilege escalation to the user that any forkserver process is running as. Setting multiprocessing.util.abstract_sockets_supported to False is a workaround. The forkserver start method for multiprocessing is not the default start method. This issue is Linux specific because only Linux supports abstract namespace sockets. CPython before 3.9 does not make use of Linux abstract namespace sockets by default. Support for users manually specifying an abstract namespace socket was added as a bugfix in 3.7.8 and 3.8.3, but users would need to make specific uncommon API calls in order to do that in CPython before 3.9.

