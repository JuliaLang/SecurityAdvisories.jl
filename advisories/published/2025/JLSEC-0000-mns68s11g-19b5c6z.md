```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns68s11g-19b5c6z"
modified = 2025-10-19T19:26:25.348Z
upstream = ["CVE-2023-30571"]
references = ["https://github.com/libarchive/libarchive/issues/1876", "https://groups.google.com/g/libarchive-announce", "https://github.com/libarchive/libarchive/issues/1876", "https://groups.google.com/g/libarchive-announce"]

[[affected]]
pkg = "LibArchive_jll"
ranges = ["< 3.7.4+0"]

[[jlsec_sources]]
id = "CVE-2023-30571"
imported = 2025-10-19T19:26:25.348Z
modified = 2025-01-14T17:15:11.673Z
published = 2023-05-29T20:15:09.513Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-30571"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-30571"
```

# Libarchive through 3.6.2 can cause directories to have world-writable permissions

Libarchive through 3.6.2 can cause directories to have world-writable permissions. The umask() call inside archive_write_disk_posix.c changes the umask of the whole process for a very short period of time; a race condition with another thread can lead to a permanent umask 0 setting. Such a race condition could lead to implicit directory creation with permissions 0777 (without the sticky bit), which means that any low-privileged local user can delete and rename files inside those directories.

