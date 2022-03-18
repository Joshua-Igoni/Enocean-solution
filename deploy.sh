#!/bin/bash

sudo su
apt-get udate
apt install -y docker.io
wget https://www.openssl.org/source/old/1.1.0/openssl-1.1.0g.tar.gz
tar xzvf openssl-1.0.2l.tar.gz
cd openssl-1.0.2l
./config
make
sudo make install
openssl version -a
cd ..
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version
echo "password" > /env_vars/a_password
echo "username" > /env_vars/a_username
echo "34.221.56.204:8080" > /env_vars/callback_url
echo "password" > /env_vars/g_password
echo "username" > /env_vars/g_username
echo "IUBXY-NSFKR-QZPCI-HVMOQ" >/env_vars/license_key
cd nginx
openssl genrsa -out dev.localhost.key 2048
openssl req -new -key dev.localhost.key -subj /CN=NG/ -out dev.localhost.crt
openssl x509 -req -days 3650 -in dev.localhost.crt -signkey dev.localhost.key -out dev.localhost.key
rm /etc/nginx/nginx.conf
mv nginx.conf /etc/nginx/
cd ..
cd local_deployment
docker-compose up -d

