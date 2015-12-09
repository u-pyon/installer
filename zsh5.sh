#!/bin/sh

yum -y install ncurses-devel ncurses wget
pushd /usr/local/src
wget http://sourceforge.net/projects/zsh/files/zsh/5.2/zsh-5.2.tar.gz/download
if [ -f download ]; then
  mv ./download zsh-5.2.tar.gz
fi
tar zxf ./zsh-5.2.tar.gz
cd zsh-5.2/
./configure
make
make install
popd
chsh
