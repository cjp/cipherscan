#!/bin/sh
#
# cipherscan.sh -- Test an SSL/TLS server for cipher suite acceptance.
#
# $Id: cipherscan.sh,v 1.1 2012/02/16 17:14:46 cjp Exp $
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

if echo "" | nc $hostname $port 2&>1 >/dev/null; then
  echo "Testing $hostname, port $port."

  for cipher in `openssl ciphers -v 'ALL:eNULL' | cut -d' ' -f1`; do
    echo -e "\n" | \
      openssl s_client -cipher "-ALL:$cipher" \
                       -connect $hostname:$port \
                          3>&1 1>/dev/null 2>&3 | grep -n error >/dev/null;
    echo -en "$?\t$cipher\n";
  done
else
  echo >&2 "Error connecting to $hostname on port $port."
  exit 65;
fi
#
# $Log$
#
