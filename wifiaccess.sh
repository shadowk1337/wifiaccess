#!/bin/bash

ETH=eth0
BR=br0

ETH_CONNECTED=$(sudo ethtool $ETH | grep "Link detected" | grep yes)

if [ -z "$ETH_CONNECTED" ]; then
	sudo ifdown $BR		   > /dev/null 2>&1
	sudo service hostapd stop  > /dev/null 2>&1
	sudo service dnsmasq stop  > /dev/null 2>&1
else
	sudo ifup $BR    	   > /dev/null 2>&1
	sudo service hostapd start > /dev/null 2>&1
	sudo service dnsmasq start > /dev/null 2>&1
fi
