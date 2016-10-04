#!/bin/sh

# Assigining an IP address and mask to 'tun0' interface
ifconfig tun0 mtu 1500 up 192.168.9.1 netmask 255.255.255.0

# Modifying IP routing tables
route del default
# 'server' is the IP address of the proxy server
# 'gateway' and 'interface' can be obtained by usint the command: 'route -n'
route add -host $(dig +short apertron.net) gw dev wlp2s0
route add default gw 192.168.9.1 tun0
