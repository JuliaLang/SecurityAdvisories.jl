```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnle5wu-1d0u1ef"
modified = 2025-11-26T03:31:20.814Z
upstream = ["CVE-2022-4743"]
references = ["https://access.redhat.com/security/cve/CVE-2022-4743", "https://bugzilla.redhat.com/show_bug.cgi?id=2156290", "https://github.com/libsdl-org/SDL/commit/00b67f55727bc0944c3266e2b875440da132ce4b", "https://github.com/libsdl-org/SDL/pull/6269", "https://lists.debian.org/debian-lts-announce/2023/02/msg00008.html", "https://security.gentoo.org/glsa/202305-18", "https://access.redhat.com/security/cve/CVE-2022-4743", "https://bugzilla.redhat.com/show_bug.cgi?id=2156290", "https://github.com/libsdl-org/SDL/commit/00b67f55727bc0944c3266e2b875440da132ce4b", "https://github.com/libsdl-org/SDL/pull/6269", "https://lists.debian.org/debian-lts-announce/2023/02/msg00008.html", "https://lists.debian.org/debian-lts-announce/2025/11/msg00024.html", "https://security.gentoo.org/glsa/202305-18"]

[[affected]]
pkg = "SDL2_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2022-4743"
imported = 2025-11-26T03:31:20.814Z
modified = 2025-11-25T21:15:53.873Z
published = 2023-01-12T19:15:24.457Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-4743"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-4743"
```

# A potential memory leak issue was discovered in SDL2 in GLES_CreateTexture() function in SDL_render_...

A potential memory leak issue was discovered in SDL2 in GLES_CreateTexture() function in SDL_render_gles.c. The vulnerability allows an attacker to cause a denial of service attack. The vulnerability affects SDL2 v2.0.4 and above. SDL-1.x are not affected.

