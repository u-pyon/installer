#!/bin/sh

yum -y install ncurses-devel ncurses
cd /usr/local/src
wget http://sourceforge.net/projects/zsh/files/zsh/5.0.2/zsh-5.0.2.tar.gz/download
tar zxf ./zsh-5.0.2.tar.gz
cd zsh-5.0.2
./configure
./make
./make install
