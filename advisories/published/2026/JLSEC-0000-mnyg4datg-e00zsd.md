```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4datg-e00zsd"
modified = 2026-03-26T21:18:55.492Z
upstream = ["CVE-2015-8325"]
references = ["http://rhn.redhat.com/errata/RHSA-2016-2588.html", "http://rhn.redhat.com/errata/RHSA-2017-0641.html", "http://www.debian.org/security/2016/dsa-3550", "http://www.securityfocus.com/bid/86187", "http://www.securitytracker.com/id/1036487", "https://anongit.mindrot.org/openssh.git/commit/?id=85bdcd7c92fe7ff133bbc4e10a65c91810f88755", "https://bugzilla.redhat.com/show_bug.cgi?id=1328012", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://people.canonical.com/~ubuntu-security/cve/2015/CVE-2015-8325.html", "https://security-tracker.debian.org/tracker/CVE-2015-8325", "https://security.gentoo.org/glsa/201612-18", "https://security.netapp.com/advisory/ntap-20180628-0001/", "http://rhn.redhat.com/errata/RHSA-2016-2588.html", "http://rhn.redhat.com/errata/RHSA-2017-0641.html", "http://www.debian.org/security/2016/dsa-3550", "http://www.securityfocus.com/bid/86187", "http://www.securitytracker.com/id/1036487", "https://anongit.mindrot.org/openssh.git/commit/?id=85bdcd7c92fe7ff133bbc4e10a65c91810f88755", "https://bugzilla.redhat.com/show_bug.cgi?id=1328012", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://people.canonical.com/~ubuntu-security/cve/2015/CVE-2015-8325.html", "https://security-tracker.debian.org/tracker/CVE-2015-8325", "https://security.gentoo.org/glsa/201612-18", "https://security.netapp.com/advisory/ntap-20180628-0001/"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2015-8325"
imported = 2026-03-26T21:18:55.492Z
modified = 2025-04-12T10:46:40.837Z
published = 2016-05-01T01:59:00.143Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-8325"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-8325"
```

# The do_setup_env function in session.c in sshd in OpenSSH through 7.2p2, when the UseLogin feature i...

The do_setup_env function in session.c in sshd in OpenSSH through 7.2p2, when the UseLogin feature is enabled and PAM is configured to read .pam_environment files in user home directories, allows local users to gain privileges by triggering a crafted environment for the /bin/login program, as demonstrated by an LD_PRELOAD environment variable.

