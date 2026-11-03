#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2

ip addr add 10.68.16.66/30 dev eth0
ip link set eth0 up

ip addr add 10.68.10.1/23 dev eth1
ip link set eth1 up

ip addr add 10.68.16.73/30 dev eth2
ip link set eth2 up

ip route add default via 10.68.16.65

ip route add 10.68.14.128/25 via 10.68.16.74
ip route add 10.68.15.0/26 via 10.68.16.74
ip route add 10.68.15.128/26 via 10.68.16.74
ip route add 10.68.16.0/27 via 10.68.16.74
ip route add 10.68.16.48/29 via 10.68.16.74
ip route add 10.68.16.76/30 via 10.68.16.74
ip route add 10.68.16.80/30 via 10.68.16.74
ip route add 10.68.16.84/30 via 10.68.16.74
ip route add 10.68.16.88/30 via 10.68.16.74
