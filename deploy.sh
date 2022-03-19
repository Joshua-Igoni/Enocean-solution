#!/bin/bash


sudo apt-get update
sudo apt install -y docker.io nginx docker-compose
sudo usermod -aG docker $USER
sudo chown $USER /var/run/docker.sock
openssl version -a
docker-compose --version
cd deploy/env_vars
echo "password" > a_password.txt
echo "username" > a_username.txt
echo "34.221.56.204:8080" > callback_url.txt
echo "password" > g_password.txt
echo "username" > g_username.txt
echo "IUBXY-NSFKR-QZPCI-HVMOQ" > license_key.txt
cd ../nginx
openssl genrsa -out dev.localhost.key 2048
openssl req -new -key dev.localhost.key -subj /CN=NG/ -out dev.localhost.crt
openssl x509 -req -days 3650 -in dev.localhost.crt -signkey dev.localhost.key -out dev.localhost.key
sudo rm /etc/nginx/nginx.conf
sudo mv nginx.conf /etc/nginx/
cd ../local_deployment
docker-compose up -d

