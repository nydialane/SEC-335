#!/bin/bash

hostfile=$1
portfile=$2

#error checking
###
#check if file is .txt

if [[ $1 != *".txt" ]]; then
  printf "Please use a .txt file for hostfile and portfile.\nUsage: ./portscanner.sh (nameofhostfile).txt (nameofportfile).txt" && \
  exit 1
fi

if [[ $2 != *".txt" ]]; then
  printf "Please use a .txt file for hostfile and portfile.\nUsage: ./portscanner.sh (nameofhostfile).txt (nameofportfile).txt" && \
  exit 1
fi

#orginal function and creating output file

echo "host,port" >> hostports.txt
for host in $(cat $hostfile); do
  for port in $(cat $portfile); do
    timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
      echo "$host,$port" >> hostports.txt
  done
done
