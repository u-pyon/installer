#!/bin/sh

pushd /usr/local/src
wget ftp://mama.indstate.edu/linux/tree/tree-1.6.0.tgz
tar zxf tree-1.6.0.tgz
cd tree-1.6.0
make
make install
popd
tree
