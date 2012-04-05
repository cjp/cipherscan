#!/bin/sh
#
# cipherscan.sh -- Test an SSL/TLS server for cipher suite acceptance.
#
# $Id: cipherscan.sh,v 1.2 2012/02/17 14:51:31 cjp Exp cjp $
# $Source: /home/cjp/RCS/cipherscan.sh,v $
#
if [ $# -ne 2 ]; then
  echo >&2 "Usage: `basename $0` {hostname} {port}"
  exit 65;
fi

hash openssl &>-
if [ $? -eq 1 ]; then
  echo >&2 "`basename $0` requires openssl."
  exit 65;
fi 

hostname=$1;
port=$2;

echo "" | nc -w3 $hostname $port 2&>1 >/dev/null
if [ $? -eq 1 ]; then
  echo >&2 "Error connecting to $hostname on port $port."
  exit 65;
fi

echo "Testing $hostname, port $port."

for cipher in `openssl ciphers -v 'ALL:eNULL' | cut -d' ' -f1`; do
  echo -n "" | \
    openssl s_client -cipher "-ALL:$cipher" \
                     -connect $hostname:$port \
                        3>&1 1>/dev/null 2>&3 | grep -En 'handshake failure|no ciphers available|errno=104' >/dev/null;
  echo -en "$?\t$cipher\n";
done
#
# $Log: cipherscan.sh,v $
# Revision 1.2  2012/02/17 14:51:31  cjp
# Added checking for openssl.
#
#
