#!/bin/sh

yum -y install patch

pushd /usr/local/src
wget http://cr.yp.to/daemontools/daemontools-0.76.tar.gz
tar zxf daemontools-0.76.tar.gz
cd admin/daemontools-0.76/
wget http://qmail.org/moni.csi.hu/pub/glibc-2.3.1/daemontools-0.76.errno.patch
patch -s -p1 < ./daemontools-0.76.errno.patch
./package/compile
./package/install
popd
