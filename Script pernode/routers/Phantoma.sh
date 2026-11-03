#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2

ip addr add 10.68.16.86/30 dev eth0
ip link set eth0 up

ip addr add 10.68.16.1/27 dev eth1
ip link set eth1 up

ip addr add 10.68.16.89/30 dev eth2
ip link set eth2 up

# Default route naik ke Knights
ip route add default via 10.68.16.85

# Route ke Subnet Lain & Mika (A25) via Shibuya
ip route add 10.68.15.0/26 via 10.68.16.90
