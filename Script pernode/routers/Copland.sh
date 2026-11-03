#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2

# Link to Switch2 (A3)
ip addr add 10.68.16.35/29 dev eth0
ip link set eth0 up

# Link to Juri (A7)
ip addr add 10.68.15.193/26 dev eth1
ip link set eth1 up

ip addr add 10.68.8.1/23 dev eth2
ip link set eth2 up

ip route add default via 10.68.16.33 dev eth0
