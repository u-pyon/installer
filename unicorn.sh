#!/bin/bash

yum -y install pcre pcre-devel curl curl-devel libxml2-devel sqlite-devel libyaml-devel
mkdir /var/log/unicorn
touch /var/log/unicorn/error.log
touch /var/log/unicorn/access.log
chown -Rf nginx:nginx /var/log/unicorn/
