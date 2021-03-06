cipherscan
==========

cipherscan is designed to connect to an SSL/TLS server and enumerate the permitted ciphersuites.

The list of possible ciphers is obtained from the local openssl binary.

This should run on any POSIX bourne shell.

Requirements
------------

* openssl, including the binary (unsure which version)

Caveats
-------

cipherscan opens a single connection per cipher tested. So for a given test, you could be connecting to
the server around 40 times.  This can trigger IPS technologies; YMMV.

Sample Output
-------------

    Testing google.com, port 443.
    1	ECDHE-RSA-AES256-SHA
    0	ECDHE-ECDSA-AES256-SHA
    0	DHE-RSA-AES256-SHA
    0	DHE-DSS-AES256-SHA
    0	DHE-RSA-CAMELLIA256-SHA
    0	DHE-DSS-CAMELLIA256-SHA
    0	AECDH-AES256-SHA
    0	ADH-AES256-SHA
    0	ADH-CAMELLIA256-SHA
    0	ECDH-RSA-AES256-SHA
    0	ECDH-ECDSA-AES256-SHA
    1	AES256-SHA
    0	CAMELLIA256-SHA
    0	PSK-AES256-CBC-SHA
    1	ECDHE-RSA-DES-CBC3-SHA
    0	ECDHE-ECDSA-DES-CBC3-SHA
    0	EDH-RSA-DES-CBC3-SHA
    0	EDH-DSS-DES-CBC3-SHA
    0	AECDH-DES-CBC3-SHA
    0	ADH-DES-CBC3-SHA
    0	ECDH-RSA-DES-CBC3-SHA
    0	ECDH-ECDSA-DES-CBC3-SHA
    1	DES-CBC3-SHA
    0	PSK-3DES-EDE-CBC-SHA
    1	ECDHE-RSA-AES128-SHA
    0	ECDHE-ECDSA-AES128-SHA
    0	DHE-RSA-AES128-SHA
    0	DHE-DSS-AES128-SHA
    0	DHE-RSA-SEED-SHA
    0	DHE-DSS-SEED-SHA
    0	DHE-RSA-CAMELLIA128-SHA
    0	DHE-DSS-CAMELLIA128-SHA
    0	AECDH-AES128-SHA
    0	ADH-AES128-SHA
    0	ADH-SEED-SHA
    0	ADH-CAMELLIA128-SHA
    0	ECDH-RSA-AES128-SHA
    0	ECDH-ECDSA-AES128-SHA
    1	AES128-SHA
    0	SEED-SHA
    0	CAMELLIA128-SHA
    0	PSK-AES128-CBC-SHA
    1	ECDHE-RSA-RC4-SHA
    0	ECDHE-ECDSA-RC4-SHA
    0	AECDH-RC4-SHA
    0	ADH-RC4-MD5
    0	ECDH-RSA-RC4-SHA
    0	ECDH-ECDSA-RC4-SHA
    1	RC4-SHA
    1	RC4-MD5
    0	PSK-RC4-SHA
    0	EDH-RSA-DES-CBC-SHA
    0	EDH-DSS-DES-CBC-SHA
    0	ADH-DES-CBC-SHA
    0	DES-CBC-SHA
    0	EXP-EDH-RSA-DES-CBC-SHA
    0	EXP-EDH-DSS-DES-CBC-SHA
    0	EXP-ADH-DES-CBC-SHA
    0	EXP-DES-CBC-SHA
    0	EXP-RC2-CBC-MD5
    0	EXP-ADH-RC4-MD5
    0	EXP-RC4-MD5
    0	ECDHE-RSA-NULL-SHA
    0	ECDHE-ECDSA-NULL-SHA
    0	AECDH-NULL-SHA
    0	ECDH-RSA-NULL-SHA
    0	ECDH-ECDSA-NULL-SHA
    0	NULL-SHA
    0	NULL-MD5

