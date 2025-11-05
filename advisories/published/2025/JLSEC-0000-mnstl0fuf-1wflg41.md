```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl0fuf-1wflg41"
modified = 2025-11-05T03:27:35.223Z
upstream = ["CVE-2021-3658"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1984728", "https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b497b5942a8beb8f89ca1c359c54ad67ec843055", "https://github.com/bluez/bluez/commit/b497b5942a8beb8f89ca1c359c54ad67ec843055", "https://gitlab.gnome.org/GNOME/gnome-bluetooth/-/issues/89", "https://security.netapp.com/advisory/ntap-20220407-0002/", "https://bugzilla.redhat.com/show_bug.cgi?id=1984728", "https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b497b5942a8beb8f89ca1c359c54ad67ec843055", "https://github.com/bluez/bluez/commit/b497b5942a8beb8f89ca1c359c54ad67ec843055", "https://gitlab.gnome.org/GNOME/gnome-bluetooth/-/issues/89", "https://lists.debian.org/debian-lts-announce/2024/09/msg00022.html", "https://security.netapp.com/advisory/ntap-20220407-0002/"]

[[affected]]
pkg = "BlueZ_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2021-3658"
imported = 2025-11-05T03:27:35.223Z
modified = 2025-11-04T16:15:43.203Z
published = 2022-03-02T23:15:08.787Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-3658"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-3658"
```

# bluetoothd from bluez incorrectly saves adapters' Discoverable status when a device is powered down,...

bluetoothd from bluez incorrectly saves adapters' Discoverable status when a device is powered down, and restores it when powered up. If a device is powered down while discoverable, it will be discoverable when powered on again. This could lead to inadvertent exposure of the bluetooth stack to physically nearby attackers.

