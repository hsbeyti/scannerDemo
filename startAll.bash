#!/bin/bash
echo "The number of arguments is: $#"

if [ $# -ne 1 ]; then
    echo The number of arguments provided ($#) is incorrect. Please provide the config file name.
    echo usage: ./startAll configDocker
    echo the  configDocker is a text file that must contain the IP addresses of the PLC  machines, one per line \for example: 192.168.10.60
    exit 1
fi
input=$1
port=1881
#to pull the latest version, first  delete the local latest
docker rmi  hsbeyti/indausobserver:latest
# starting at port 1881 onward
while IFS= read -r line
do
   echo  "IP=$line" > .env
   echo  "port=$port" >>  .env
   echo  creating a container listening on port: $port
   echo  and communicating with the PLC maschine with IP: $line
   docker-compose  -p "cont$line" up  -d
   #generate new port for next container
   let port+=5;
   echo creating the next container ....
done < "$input"
