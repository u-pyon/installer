#!/bin/sh

cd /usr/local/src
wget http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz
tar zxf yaml-0.1.4.tar.gz
cd yaml-0.1.4
./configure
make
make install
