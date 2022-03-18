#!/bin/bash


sudo apt-get update
sudo apt install -y docker.io nginx docker-compose
openssl version -a
docker-compose --version
cd env_vars
echo "password" > a_password
echo "username" > a_username
echo "34.221.56.204:8080" > callback_url
echo "password" > g_password
echo "username" > g_username
echo "IUBXY-NSFKR-QZPCI-HVMOQ" > license_key
cd ..
cd nginx
openssl genrsa -out dev.localhost.key 2048
openssl req -new -key dev.localhost.key -subj /CN=NG/ -out dev.localhost.crt
openssl x509 -req -days 3650 -in dev.localhost.crt -signkey dev.localhost.key -out dev.localhost.key
sudo rm /etc/nginx/nginx.conf
sudo mv nginx.conf /etc/nginx/
cd ..
cd local_deployment
docker-compose up -d

