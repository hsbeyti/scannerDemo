testscanner
===========
Thsi is a branch


This project folder contains all files needed for the project ScannerDemo :
bashScripts: all necessary scripts to start and stop docker containers on the server (deployment server)
Dockerfile: to create a docker image
docker-compose: to create one container of the docker image
node-red-source: contains the node red file needed : flow.json, flow_cred.json and settings.js
This program communicates with a CPU using OPC UA protocol, it acts as an UPC UA client.

How to delpoy the docker image on the server?
1. You have to create a new realease on gitHUb, this will trigger the creation of a new image and deploying it on the dockerHub repository (hsbeyti/indausobserver:latest).

On the deploymnt server (move to this folder "/home/usbeyti/.noderred/observerNodeRed") you need to do the follwing steps:
1. You need to have the following files on the deploymnet server foler:
docker-compose.yml
startAll.bash
stopAll.bash
removeAll.bash
reStartAll.bash
configDocker

2. First write in the config  text file "configDocker" the IP  addresses of the CPUs you want to communicate with,below is an example:
192.168.33.20
192.168.33.80
192.168.33.90
192.168.33.100

3. We are assuming that a mysql conatiner is running  with the container name "mysqlnodered", if not just move to the "mysqldockerimage" folder and execute: sudo docker-compse up -d.
4. Type the following command "./startAll configDocker", this will create a new container for each IP address line of the file "configDocker" (it also pulls the lateset image form the dockerHub).
 
The follwing virtual drive is configured on the on the host:
volumes:
  mysqldockerimage_gittersDB:/var/lib/mysql
    external: true

and it uses the "bridgeAll" to communicates with other conatienrs suche msql and othe rconatiners of the smae image
networks:
  mysql-bridge:
    name: bridgeAll
    driver: bridge

