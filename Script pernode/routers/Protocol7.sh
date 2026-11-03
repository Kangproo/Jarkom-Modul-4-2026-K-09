#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2

ip addr add 10.68.16.78/30 dev eth0
ip link set eth0 up

ip addr add 10.68.16.81/30 dev eth1
ip link set eth1 up

ip addr add 10.68.15.129/26 dev eth2
ip link set eth2 up

# Default route naik ke Deus
ip route add default via 10.68.16.77

# Route ke bawah (Knights, Phantoma, Shibuya/Lain)
ip route add 10.68.16.48/29 via 10.68.16.82
ip route add 10.68.16.84/30 via 10.68.16.82
ip route add 10.68.16.0/27 via 10.68.16.82
ip route add 10.68.16.88/30 via 10.68.16.82
ip route add 10.68.15.0/26 via 10.68.16.82
