```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucvv-11yv9q"
modified = 2025-11-25T22:36:00.571Z
upstream = ["CVE-2014-1947"]
references = ["http://www.openwall.com/lists/oss-security/2014/02/12/13", "http://www.openwall.com/lists/oss-security/2014/02/12/2", "http://www.openwall.com/lists/oss-security/2014/02/13/2", "http://www.openwall.com/lists/oss-security/2014/02/13/5", "http://www.openwall.com/lists/oss-security/2014/02/19/13", "https://bugzilla.redhat.com/show_bug.cgi?id=1064098", "https://www.suse.com/support/update/announcement/2014/suse-su-20140359-1.html", "http://www.openwall.com/lists/oss-security/2014/02/12/13", "http://www.openwall.com/lists/oss-security/2014/02/12/2", "http://www.openwall.com/lists/oss-security/2014/02/13/2", "http://www.openwall.com/lists/oss-security/2014/02/13/5", "http://www.openwall.com/lists/oss-security/2014/02/19/13", "https://bugzilla.redhat.com/show_bug.cgi?id=1064098", "https://www.suse.com/support/update/announcement/2014/suse-su-20140359-1.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-1947"
imported = 2025-11-25T22:36:00.571Z
modified = 2024-11-21T02:05:19.997Z
published = 2020-02-17T21:15:12.570Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-1947"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-1947"
```

# Stack-based buffer overflow in the WritePSDImage function in coders/psd.c in ImageMagick 6.5.4 and e...

Stack-based buffer overflow in the WritePSDImage function in coders/psd.c in ImageMagick 6.5.4 and earlier allows remote attackers to cause a denial of service (crash) and possibly execute arbitrary code via a large number of layers in a PSD image, involving the L%02ld string, a different vulnerability than CVE-2014-2030.

