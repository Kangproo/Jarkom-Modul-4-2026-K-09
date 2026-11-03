#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1

ip addr add 10.68.16.90/30 dev eth0
ip link set eth0 up

ip addr add 10.68.15.1/26 dev eth1
ip link set eth1 up

ip route add default via 10.68.16.89
