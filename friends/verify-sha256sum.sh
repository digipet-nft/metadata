#!/bin/sh

set -ex

# see https://www.freetsa.org/

wget -q -O tsa.crt https://freetsa.org/files/tsa.crt
wget -q -O cacert.pem https://freetsa.org/files/cacert.pem

openssl ts -reply -in friends.tsr -text | grep 'Time stamp'
openssl ts -verify -data SHA256SUM -in friends.tsr -CAfile cacert.pem -untrusted tsa.crt
openssl ts -verify -in friends.tsr -queryfile friends.tsq -CAfile cacert.pem -untrusted tsa.crt
