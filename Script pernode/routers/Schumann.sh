#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2

ip addr add 10.68.16.36/29 dev eth0
ip link set eth0 up

ip addr add 10.68.16.41/29 dev eth1
ip link set eth1 up

ip addr add 10.68.16.69/30 dev eth2
ip link set eth2 up

ip route add default via 10.68.16.33
ip route add 10.68.4.0/22 via 10.68.16.70
