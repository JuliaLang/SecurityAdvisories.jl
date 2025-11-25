```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucvu-2wka8v"
modified = 2025-11-25T22:36:00.570Z
upstream = ["CVE-2014-2030"]
references = ["http://lists.opensuse.org/opensuse-updates/2014-03/msg00032.html", "http://lists.opensuse.org/opensuse-updates/2014-03/msg00039.html", "http://ubuntu.com/usn/usn-2132-1", "http://www.openwall.com/lists/oss-security/2014/02/12/2", "http://www.openwall.com/lists/oss-security/2014/02/13/5", "http://www.openwall.com/lists/oss-security/2014/02/19/13", "https://bugzilla.redhat.com/show_bug.cgi?id=1064098", "https://web.archive.org/web/20090120112751/http://trac.imagemagick.org/changeset/13736", "http://lists.opensuse.org/opensuse-updates/2014-03/msg00032.html", "http://lists.opensuse.org/opensuse-updates/2014-03/msg00039.html", "http://ubuntu.com/usn/usn-2132-1", "http://www.openwall.com/lists/oss-security/2014/02/12/2", "http://www.openwall.com/lists/oss-security/2014/02/13/5", "http://www.openwall.com/lists/oss-security/2014/02/19/13", "https://bugzilla.redhat.com/show_bug.cgi?id=1064098", "https://web.archive.org/web/20090120112751/http://trac.imagemagick.org/changeset/13736"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-2030"
imported = 2025-11-25T22:36:00.570Z
modified = 2024-11-21T02:05:29.753Z
published = 2020-02-06T15:15:10.637Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-2030"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-2030"
```

# Stack-based buffer overflow in the WritePSDImage function in coders/psd.c in ImageMagick, possibly 6...

Stack-based buffer overflow in the WritePSDImage function in coders/psd.c in ImageMagick, possibly 6.8.8-5, allows remote attackers to cause a denial of service (crash) and possibly execute arbitrary code via a crafted PSD image, involving the L%06ld string, a different vulnerability than CVE-2014-1947.

