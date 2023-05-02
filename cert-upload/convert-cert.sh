#/bin/bash

if (( $# != 2 )); then
    echo "Usage: $0 <pkcs12 file name> <pkcs12 password>"
    exit
fi

if [[ ! -d ~/.f5xc ]]
then
    mkdir ~/.f5xc
    chmod 700 ~/.f5xc
fi

openssl pkcs12 -password pass:$2 -info -in $1 -out ~/.f5xc/volterra.key -nodes -nocerts
openssl pkcs12 -password pass:$2 -info -in $1 -out ~/.f5xc/volterra.cert -nokeys

chmod 600 ~/.f5xc/volterra.key

