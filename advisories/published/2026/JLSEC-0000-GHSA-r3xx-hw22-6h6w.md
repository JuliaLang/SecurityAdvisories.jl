```toml
schema_version = "1.8.0"
id = "JLSEC-0000-GHSA-r3xx-hw22-6h6w"
modified = 2026-07-23T21:55:40.480Z
aliases = ["GHSA-r3xx-hw22-6h6w"]

[[affected]]
pkg = "LibSSH"
ranges = ["< 1.1.0"]

[[jlsec_sources]]
id = "GHSA-r3xx-hw22-6h6w"
imported = 2026-07-23T21:55:40.451Z
modified = 2026-07-23T19:14:03.000Z
published = 2026-07-23T19:14:03.000Z
url = "https://api.github.com/repos/JuliaWeb/LibSSH.jl/security-advisories/GHSA-r3xx-hw22-6h6w"
html_url = "https://github.com/JuliaWeb/LibSSH.jl/security/advisories/GHSA-r3xx-hw22-6h6w"
```

# Writing to SFTP files resulting in sending out-of-bounds data to the server

### Impact

The `write(::SftpFile, ::DenseVector)` method assumed that the element type of the input vector had a size of 1 byte (e.g. `Int8`/`UInt8`), and used `length(data)` instead of `sizeof(data)` to get the number of bytes to send. If the input vector had a eltype with size more than 1 byte then this would result in some bytes *before* the vector in memory being sent (or a segfault).

Any user writing to an `SftpFile` is potentially impacted.

### Patches

The bug has been fixed in LibSSH v1.2.0.

### Workarounds

Ensure that all inputs to writing `SftpFile`'s are byte vectors.

