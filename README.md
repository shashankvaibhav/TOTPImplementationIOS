# TOTPImplementationIOS

TOTP is an example of a hash-based message authentication code (HMAC). It combines a secret key with the current timestamp 
using a cryptographic hash function to generate a one-time password. Because network latency and out-of-sync clocks can result
in the password recipient having to try a range of possible times to authenticate against, the timestamp typically increases 
in 30-second intervals, which thus cuts the potential search space.


Same algorithm is used by Google for Gmail.
They also created a app Google Authenticator using the same algorithm.


