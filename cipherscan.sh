#!/bin/sh
#
# cipherscan.sh -- Test an SSL/TLS server for cipher suite acceptance.
#
if [ $# -ne 2 ]; then
  printf >&2 "Usage: `basename %s` {hostname} {port}\n" "$0"
  exit 65;
fi

hash openssl &>-
if [ $? -eq 1 ]; then
  printf >&2 "`basename %s` requires openssl.\n" "$0"
  exit 65;
fi 

hostname=$1;
port=$2;

printf "\n" | nc -w3 $hostname $port 2&>1 >/dev/null
if [ $? -eq 1 ]; then
  printf >&2 "Error connecting to %s on port %s.\n" "$hostname" "$port"
  exit 65;
fi

printf "Testing %s, port %s.\n" "$hostname" "$port"

for cipher in `openssl ciphers -v 'ALL:eNULL' | cut -d' ' -f1`; do
  printf "" | \
    openssl s_client -cipher "-ALL:$cipher" \
                     -connect $hostname:$port \
                        3>&1 1>/dev/null 2>&3 | grep -En 'handshake failure|no ciphers available|errno=104' >/dev/null;
  printf "%s\t%s\n" "$?" "$cipher";
done
