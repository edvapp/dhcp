#! /bin/bash

cd /etc/dhcp
echo "################################################"
echo "git checkout dhcpd.conf ########################"
sudo git checkout dhcpd.conf

echo "################################################"
echo "git pull start #################################"
sudo git pull origin master

echo "################################################"
echo "restart isc-dhcp-server ########################"
sudo service isc-dhcp-server restart
cd

echo "################################################"
echo "tail /var/log/syslog start #####################"
tail /var/log/syslog

echo "################################################"
echo "tail /var/log/syslog stop ######################"

echo "################################################"
echo "isc-dhcp-server status #########################"
service isc-dhcp-server status
