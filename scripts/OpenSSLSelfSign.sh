#! /bin/bash

mkdir -p output

openssl genrsa -out output/private.key 2048

openssl req -new -x509 -nodes -key output/private.key -out output/cert.crt -days 365 -subj "/C=RU/ST=Moscoew/L=Moscow/O=MyCompany/CN=localhost"

echo "Сертификаты созданы в папке .output/"
./MoveSSL.sh
