#! /bin/bash
mkdir -p ../.nginx/certs/
mv output/private.key output/cert.crt ../.nginx/certs/
echo "Сертификаты перемещены из output/ в ../.nginx/certs"
