```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl0h86-zanu33"
modified = 2025-11-05T03:27:37.014Z
upstream = ["CVE-2022-28739"]
references = ["http://seclists.org/fulldisclosure/2022/Oct/28", "http://seclists.org/fulldisclosure/2022/Oct/29", "http://seclists.org/fulldisclosure/2022/Oct/30", "http://seclists.org/fulldisclosure/2022/Oct/41", "http://seclists.org/fulldisclosure/2022/Oct/42", "https://hackerone.com/reports/1248108", "https://lists.debian.org/debian-lts-announce/2023/06/msg00012.html", "https://security-tracker.debian.org/tracker/CVE-2022-28739", "https://security.gentoo.org/glsa/202401-27", "https://security.netapp.com/advisory/ntap-20220624-0002/", "https://support.apple.com/kb/HT213488", "https://support.apple.com/kb/HT213493", "https://support.apple.com/kb/HT213494", "https://www.ruby-lang.org/en/news/2022/04/12/buffer-overrun-in-string-to-float-cve-2022-28739/", "http://seclists.org/fulldisclosure/2022/Oct/28", "http://seclists.org/fulldisclosure/2022/Oct/29", "http://seclists.org/fulldisclosure/2022/Oct/30", "http://seclists.org/fulldisclosure/2022/Oct/41", "http://seclists.org/fulldisclosure/2022/Oct/42", "https://hackerone.com/reports/1248108", "https://lists.debian.org/debian-lts-announce/2023/06/msg00012.html", "https://lists.debian.org/debian-lts-announce/2024/09/msg00000.html", "https://security-tracker.debian.org/tracker/CVE-2022-28739", "https://security.gentoo.org/glsa/202401-27", "https://security.netapp.com/advisory/ntap-20220624-0002/", "https://support.apple.com/kb/HT213488", "https://support.apple.com/kb/HT213493", "https://support.apple.com/kb/HT213494", "https://www.ruby-lang.org/en/news/2022/04/12/buffer-overrun-in-string-to-float-cve-2022-28739/"]

[[affected]]
pkg = "ruby_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2022-28739"
imported = 2025-11-05T03:27:37.014Z
modified = 2025-11-04T16:15:48.840Z
published = 2022-05-09T18:15:08.540Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-28739"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-28739"
```

# There is a buffer over-read in Ruby before 2.6.10, 2.7.x before 2.7.6, 3.x before 3.0.4, and 3.1.x b...

There is a buffer over-read in Ruby before 2.6.10, 2.7.x before 2.7.6, 3.x before 3.0.4, and 3.1.x before 3.1.2. It occurs in String-to-Float conversion, including Kernel#Float and String#to_f.

