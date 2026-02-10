#!/bin/bash

base=$1
port=$2

echo "host,port" 

for i in {1..254}
	 do
    timeout .1 bash -c "echo >/dev/tcp/"$base.$i"/$port" 2>/dev/null &&
      echo ""$base.$i",$port"
  done

