#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2
ip addr flush dev eth3

ip addr add 10.68.16.62/30 dev eth0
ip link set eth0 up

ip addr add 10.68.12.1/24 dev eth1
ip link set eth1 up

ip addr add 10.68.15.65/26 dev eth2
ip link set eth2 up

ip addr add 10.68.13.1/24 dev eth3
ip link set eth3 up

ip route add default via 10.68.16.61
