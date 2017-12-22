#! /bin/bash

cd /etc/dhcp
echo "################################################"
echo "## git checkout dhcpd.conf                     #"
echo "################################################"
sudo git checkout dhcpd.conf

echo "################################################"
echo "## git pull origin master                      #"
echo "################################################"
sudo git pull origin master

echo "################################################"
echo "## systemctl restart isc-dhcp-server.service   #"
echo "################################################"
sudo systemctl restart isc-dhcp-server.service
cd

echo "################################################"
echo "## systemctl status isc-dhcp-server.service    #"
echo "################################################"
sudo systemctl status isc-dhcp-server.service

echo "################################################"
echo "## journalctl -u isc-dhcp-server.service       #"
echo "################################################"
sudo journalctl -u isc-dhcp-server.service
