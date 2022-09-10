#!/bin/sh

set -ex

# see https://www.freetsa.org/

wget -q -O tsa.crt https://freetsa.org/files/tsa.crt
wget -q -O cacert.pem https://freetsa.org/files/cacert.pem

openssl ts -reply -in shiba.tsr -text | grep 'Time stamp'
openssl ts -verify -data SHA256SUM -in shiba.tsr -CAfile cacert.pem -untrusted tsa.crt
openssl ts -verify -in shiba.tsr -queryfile shiba.tsq -CAfile cacert.pem -untrusted tsa.crt
