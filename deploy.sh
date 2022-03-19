#!/bin/bash


sudo apt-get update
sudo apt install -y docker.io nginx docker-compose
sudo usermod -aG docker $USER
sudo chown $USER /var/run/docker.sock
openssl version -a
docker-compose --version
export BASIC_AUTH_USERNAME=username
export BASIC_AUTH_PASSWORD=password
echo "52.43.164.208:8080" > callback_url.txt
echo "password" > g_password.txt
echo "username" > g_username.txt
echo "IUBXY-NSFKR-QZPCI-HVMOQ" > license_key.txt
cd ../nginx
openssl genrsa -out dev.localhost.key 2048
openssl req -new -key dev.localhost.key -subj /CN=NG/ -out dev.localhost.crt
openssl x509 -req -days 3650 -in dev.localhost.crt -signkey dev.localhost.key -out dev.localhost.key
sudo mkdir -p /etc/nginx/certs
sudo rm /etc/nginx/nginx.conf
sudo mv ./nginx.conf /etc/nginx/
sudo cp ./dev.localhost.crt /etc/nginx/certs 
sudo cp ./dev.localhost.key /etc/nginx/certs
sudo mv /etc/nginx/certs/dev.localhost.crt /etc/nginx/certs/certs.crt
sudo mv /etc/nginx/certs/dev.localhost.key /etc/nginx/certs/certs.key 
sudo systemctl restart nginx 
cd ../local_deployment
docker-compose up -d

