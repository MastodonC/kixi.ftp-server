#!/bin/bash
echo "Building docker image through vagrant.... this may take a while"
vagrant up
echo "Finding IP address..."
while [ -z $(docker ps | grep FTP-SERVER | awk '{print $1}') ]
do
  echo "Not up yet"
  sleep 1
done 

IPADDRESS=$(docker inspect FTP-SERVER | grep IPAddress | cut -d '"' -f 4)
echo "The IP Address is: $IPADDRESS"

echo "Connecting to FTP server..."
#username bob password bob
ftp $IPADDRESS

#(docker rm -f FTP-SERVER)
#docker rmi Narwhal

exit 0
