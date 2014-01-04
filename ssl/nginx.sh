#!/bin/sh

# The wrong number of args
if [ $# -ne 1 ]; then
  echo "domain name is required." 1>&2
  exit 1;
fi


# Create .pem
domain=$1
ssl_key_path=/etc/nginx/ssl.key
if [ ! -d $ssl_key_path ]; then
  mkdir $ssl_key_path
fi

dat="/etc/nginx/ssl.key/${domain}.dat"
com_dat="openssl md5 /etc/nginx/conf.d/* >& ${dat}"
pem="${ssl_key_path}/${domain}.pem"
com="openssl genrsa -rand ${dat} -des3 2048 > ${pem}"


# If .pem exists, confirm to create or to exit
if [ -f $pem -a -s $pem ]; then
  while read -p "${pem} exists. Would you create new ${domain}.pem? [y/n]" yn; do
    case $yn in
      [Yy]* ) {
        rm $pem
        openssl md5 /etc/nginx/conf.d/* > $dat
        openssl genrsa -rand $dat -des3 2048 > $pem
        echo "Created new ${pem}."
        break
      };;
      [Nn]* ) {
        echo "Didn't run openssl command."
        exit 1
      };;
      * ) {
        echo "Please answer y or n."
        continue 1
      };;
    esac
  done
else
  openssl md5 /etc/nginx/conf.d/* > $dat
  openssl genrsa -rand $dat -des3 2048 > $pem
fi


# Unlock .pem from password
if [ -f $pem ]; then
  openssl rsa -in $pem -out $pem
fi

# Create .csr
csr="${ssl_key_path}/${domain}.csr"
echo "JP|Tokyo|Shibuya-ku|SRE Inc,|null|{Your Domain}|null|null|null"
openssl req -new -key $pem -out $csr

cat $csr
