#!/bin/bash
echo "The number of arguments is: $#"

if [ $# -ne 1 ]; then
    echo The number of arguments provided is incorrect. Please provide the config file name.
    echo usage: ./startAll configDocker
    echo the  configDocker is a text file that must contain the IP addresses of the PLC  machines, one per line example: 192.168.10.60
    exit 1
fi
input=$1
port=1881
# starting at port 1881 onward
while IFS= read -r line
do
   echo  "IP=$line" > .env
   echo  "port=$port" >>  .env
   echo  conatiner is now listening to post $port
   echo  and communicate with CPU IP: $line
   docker-compose  -p "cont$line" up  -d
   sleep 5
   let port+=5;
   echo creating next conatiner
done < "$input"
