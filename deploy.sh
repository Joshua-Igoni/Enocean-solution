#!/bin/bash


sudo apt-get update
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER
sudo chown $USER /var/run/docker.sock
openssl version -a
docker-compose --version
cd deploy/nginx
openssl genrsa -out dev.localhost.key 2048
openssl req -new -key dev.localhost.key -subj /CN=NG/ -out dev.localhost.csr
openssl x509 -req -days 3650 -in dev.localhost.csr -signkey dev.localhost.key -out dev.localhost.key 
cd ../local_deployment
docker-compose up -d

