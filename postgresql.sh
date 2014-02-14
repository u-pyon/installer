#!/bin/bash

wget -P /tmp http://yum.postgresql.org/9.2/redhat/rhel-6-x86_64/pgdg-centos92-9.2-6.noarch.rpm
sudo rpm -ivh /tmp/pgdg-centos92-9.2-6.noarch.rpm
yum install -y postgresql92-server postgresql92-devel postgresql92-contrib
/etc/rc.d/init.d/postgresql-9.2 initdb
/etc/rc.d/init.d/postgresql-9.2 start
chkconfig postgresql-9.2 on
chkconfig --list | grep postgresql-9.2

# Add ~/.bashrc or ~/.zshrc
