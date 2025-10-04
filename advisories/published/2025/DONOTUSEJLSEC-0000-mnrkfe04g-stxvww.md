```toml
schema_version = "1.7.3"
id = "DONOTUSEJLSEC-0000-mnrkfe04g-stxvww"
modified = 2025-10-04T13:00:32.416Z
upstream = ["CVE-2020-28912"]
references = ["https://hackerone.com/reports/1019891", "https://jira.mariadb.org/browse/MDEV-24040", "https://hackerone.com/reports/1019891", "https://jira.mariadb.org/browse/MDEV-24040"]

[[affected]]
pkg = "MariaDB_Connector_C_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2020-28912"
imported = 2025-10-04T13:00:32.416Z
modified = 2024-11-21T05:23:16.837Z
published = 2020-12-24T20:15:12.460Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-28912"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-28912"
```

# With MariaDB running on Windows, when local clients connect to the server over named pipes, it's pos...

With MariaDB running on Windows, when local clients connect to the server over named pipes, it's possible for an unprivileged user with an ability to run code on the server machine to intercept the named pipe connection and act as a man-in-the-middle, gaining access to all the data passed between the client and the server, and getting the ability to run SQL commands on behalf of the connected user. This occurs because of an incorrect security descriptor. This affects MariaDB Server before 10.1.48, 10.2.x before 10.2.35, 10.3.x before 10.3.26, 10.4.x before 10.4.16, and 10.5.x before 10.5.7. NOTE: this issue exists because certain details of the MariaDB CVE-2019-2503 fix did not comprehensively address attack variants against MariaDB. This situation is specific to MariaDB, and thus CVE-2020-28912 does NOT apply to other vendors that were originally affected by CVE-2019-2503.

