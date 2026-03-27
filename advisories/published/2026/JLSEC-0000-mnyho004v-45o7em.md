```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyho004v-45o7em"
modified = 2026-03-27T23:16:13.615Z
upstream = ["CVE-2021-41641"]
references = ["https://github.com/denoland/deno/issues/12152", "https://hackers.report/report/614876917a7b150012836bb8", "https://github.com/denoland/deno/issues/12152", "https://hackers.report/report/614876917a7b150012836bb8"]

[[affected]]
pkg = "Deno_jll"
ranges = [">= 1.10.3+0, < 1.14.3+0"]

[[jlsec_sources]]
id = "CVE-2021-41641"
imported = 2026-03-27T23:16:13.615Z
modified = 2024-11-21T06:26:33.573Z
published = 2022-06-12T13:15:07.747Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-41641"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-41641"
```

# Deno <=1.14.0 file sandbox does not handle symbolic links correctly

Deno <=1.14.0 file sandbox does not handle symbolic links correctly. When running Deno with specific write access, the Deno.symlink method can be used to gain access to any directory.

