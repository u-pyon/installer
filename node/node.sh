#!/bin/bash
version="0.10.24"
cd /usr/local/src/
yum -y install openssl-devel libgcc gcc cpp
wget -N http://nodejs.org/dist/node-latest.tar.gz
tar xzvf node-latest.tar.gz
cd node-v${version}/
make
make install
node -v

