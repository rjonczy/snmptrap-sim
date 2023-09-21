#!/bin/bash

while :
do
  echo "Sending SNMP trap to snmptrapd"

  # send trap (v2c)
  sleep 1
  snmptrap \
    -v2c \
    -c public \
    -m ALL \
    -M /mibs \
    snmptrap_receiver:1062 \
    123 1.3.6.1.6.3.1.1.5.1

  # send inform request
  sleep 1
  snmpinform \
    -v2c \
    -c public \
    -M /mibs \
    snmptrap_receiver:1062 \
    123 1.3.6.1.6.3.1.1.5.1

  # send trap (v3)
  sleep 1
  snmptrap \
    -v3 \
    -u user-sha-aes128 \
    -l authPriv \
    -a SHA \
    -A authkey1 \
    -x AES \
    -X privkey1 \
    -e 8000000001020304 \
    -M /mibs \
    snmptrap_receiver:1062 \
    123 1.3.6.1.6.3.1.1.5.1
	
  sleep 5
done
