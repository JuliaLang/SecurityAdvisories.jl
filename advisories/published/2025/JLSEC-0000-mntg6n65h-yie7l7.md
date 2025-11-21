```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntg6n65h-yie7l7"
modified = 2025-11-20T23:04:03.557Z
upstream = ["CVE-2025-59438"]
references = ["https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2025-10-invalid-padding-error/", "https://mbed-tls.readthedocs.io/en/latest/tech-updates/security-advisories/"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-59438"
imported = 2025-11-20T23:04:03.557Z
modified = 2025-10-23T12:35:35.187Z
published = 2025-10-21T15:15:39.103Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-59438"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-59438"
```

# Padding oracle through timing of cipher error reporting

## Vulnerability

In symmetric encryption modes that involve padding, if an attacker can submit ciphertexts for decryption and learn whether the padding is valid, this provides partial information about the plaintext. If the attacker can also submit input that the victim encrypts together with a secret, this can allow the attacker to recover the whole secret part. This is known as a padding oracle attack. The attacker may learn the validity of the padding directly or indirectly, for example through timing.

In the Mbed TLS legacy API (`mbedtls_cipher_crypt()`, `mbedtls_cipher_finish()`), the problematic modes are ECB and CBC with any padding other than `NONE`. In the PSA Crypto API (`psa_cipher_decrypt()`, `psa_cipher_finish()`), the problematic algorithm is `PSA_ALG_CBC_PKCS7`.

Mbed TLS takes care to check the padding in constant time inside the legacy cipher modules, so `mbedtls_cipher_crypt()` and `mbedtls_cipher_finish()` are not vulnerable. However, application code may be vulnerable if it handles errors from these functions in a way that is not constant-time.

In the PSA API, when the built-in implementation of CBC-PKCS7 is used, the PSA functions  (`psa_cipher_decrypt()`, `psa_cipher_finish()`) call `mbedtls_cipher_finish()` and translate its error codes into PSA error codes. This translation is not constant-time, and a local unprivileged attacker may be able to observe which error is raised by timing shared resources such as a code cache or a branch predictor.

In the PSA API, when using a driver, there is no error translation. However some code paths inside the library distinguish the error case from the success case, which allows the same attack.

## Impact

Local attackers may be able to recover plaintexts encrypted with CBC-PKCS7 or other symmetric encryption mode using padding when it is decrypted through the PSA API.

Applications using the legacy API to decrypt with padding may be affected through their own error handling.

## Affected versions

All versions of Mbed TLS up to 3.6.4 are affected.

TF-PSA-Crypto 1.0.0beta is also affected.

## Work-around

Applications are not affected if they only accept authenticated ciphertexts for CBC decryption, i.e. if they only use CBC as part of an encrypt-then-MAC construction. (Applications should use AEAD modes instead of CBC-based modes whenever possible.)

## Resolution

Affected users should upgrade to Mbed TLS 3.6.5 or TF-PSA-Crypto 1.0.0 or above.

Additionally, applications using `mbedtls_cipher_crypt()` or `mbedtls_cipher_finish()` with a CBC or EBC mode with padding should review their error handling, and should consider switching to the new function `mbedtls_cipher_finish_padded()` which simplifies the handling of invalid-padding conditions.

Applications doing decryption with `PSA_ALG_CBC_PKCS7` should handle errors carefully if local timing attacks are a concern. (This also applies to asymmetric decryption with `PSA_ALG_RSA_PKCS1V15_CRYPT`.)
