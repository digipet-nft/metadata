This repository contains SHA-256 of [Digipet NFT](https://digipetnft.com) metadata. There are two collections of Digipet NFT, Shiba and Friends. We are going to publish metadata after all collections are sold out.

To verify timestamp of SHA256SUM, run verify-sha256sum.sh in each folder.

Output for Shiba should be:
```
+ wget -q -O tsa.crt https://freetsa.org/files/tsa.crt
+ wget -q -O cacert.pem https://freetsa.org/files/cacert.pem
+ openssl ts -reply -in shiba.tsr -text
+ grep 'Time stamp'
Time stamp: Sep 10 07:51:02 2022 GMT
+ openssl ts -verify -data SHA256SUM -in shiba.tsr -CAfile cacert.pem -untrusted tsa.crt
Verification: OK
+ openssl ts -verify -in shiba.tsr -queryfile shiba.tsq -CAfile cacert.pem -untrusted tsa.crt
Verification: OK
```

Output for Friends:
```
+ wget -q -O tsa.crt https://freetsa.org/files/tsa.crt
+ wget -q -O cacert.pem https://freetsa.org/files/cacert.pem
+ openssl ts -reply -in friends.tsr -text
+ grep 'Time stamp'
Time stamp: Sep 10 07:46:05 2022 GMT
+ openssl ts -verify -data SHA256SUM -in friends.tsr -CAfile cacert.pem -untrusted tsa.crt
Verification: OK
+ openssl ts -verify -in friends.tsr -queryfile friends.tsq -CAfile cacert.pem -untrusted tsa.crt
Verification: OK
```

For more information, see [Time Stamp Authority](https://www.freetsa.org/)
