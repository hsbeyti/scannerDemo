testscanner
===========



This project folder contains all files needed for the project ScannerDemo :
bashScripts: all necessary scripts to start and stop docker containers on the server (deployment server)
docker-compose: to create one container of the scannerDemo Image
node-red-source: contains the node red file needed : flow.json, flow_cred.json and settings.js

How to operate?

It communicates with a CPU using OPC UA protocol, it acts as an UPC UA client.
1. First you move to scannerDemo folder (on the deployment server, for the first time create a new one).
2. You need to pull into this folder the corresponding docker image form the docker-hub cloud repository  "hsbeyti/indaus", type the command "sudo docker pull hsbeyti/indaus:observer1.x". 
3. You need also to have the following files in this folder:
docker-compose.yml
startAll.bash
stopAll.bash
removeAll.bash
reStartAll.bash
configDocker

4. Write in the config  text file "configDocker" the IP add addresses of the CPU you want to communicate with see below is an example:
192.168.33.20
192.168.33.80
192.168.33.90
192.168.33.100

5. Type the following command "./startAll configDocker", this will create a new container for each IP address line of the file "configDocker"
 
The follwing virtual drive is configured on the on the host:
volumes:
  mysqldockerimage_gittersDB:/var/lib/mysql
    external: true

and it uses the "bridgeAll" to communicates with other conatienrs suche msql and othe rconatiners of the smae image
networks:
  mysql-bridge:
    name: bridgeAll
    driver: bridge

