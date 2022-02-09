#restart all available containers
sudo docker start container $(sudo docker ps -aq)

