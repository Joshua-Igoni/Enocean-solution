#!/bin/bash

sudo apt-get update
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER
sudo chown $USER /var/run/docker.sock
openssl version -a
docker-compose --version
cd deploy/nginx
openssl req -newkey rsa:4096 -x509 -sha256 -nodes -days 365 -out dev.100.24.8.128.crt -keyout dev.100.24.8.128.key
cd ../local_deployment
docker-compose up