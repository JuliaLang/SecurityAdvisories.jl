```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubsy-1dhhnca"
modified = 2025-11-25T22:35:59.170Z
upstream = ["CVE-2016-4563"]
references = ["http://www.imagemagick.org/script/changelog.php", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "https://github.com/ImageMagick/ImageMagick/commit/726812fa2fa7ce16bcf58f6e115f65427a1c0950", "http://www.imagemagick.org/script/changelog.php", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "https://github.com/ImageMagick/ImageMagick/commit/726812fa2fa7ce16bcf58f6e115f65427a1c0950"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-4563"
imported = 2025-11-25T22:35:59.170Z
modified = 2025-04-12T10:46:40.837Z
published = 2016-06-04T16:59:01.390Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-4563"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-4563"
```

# The TraceStrokePolygon function in MagickCore/draw.c in ImageMagick before 6.9.4-0 and 7.x before 7....

The TraceStrokePolygon function in MagickCore/draw.c in ImageMagick before 6.9.4-0 and 7.x before 7.0.1-2 mishandles the relationship between the BezierQuantum value and certain strokes data, which allows remote attackers to cause a denial of service (buffer overflow and application crash) or possibly have unspecified other impact via a crafted file.

