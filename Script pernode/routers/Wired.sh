#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2
ip addr flush dev eth3

ip addr add 10.68.16.58/30 dev eth0
ip link set eth0 up

ip addr add 10.68.16.61/30 dev eth1
ip link set eth1 up

ip addr add 10.68.16.33/29 dev eth2
ip link set eth2 up

ip addr add 10.68.16.65/30 dev eth3
ip link set eth3 up

ip route add default via 10.68.16.57

ip route add 10.68.0.0/22 via 10.68.16.34
ip route add 10.68.8.0/23 via 10.68.16.35
ip route add 10.68.15.192/26 via 10.68.16.35
ip route add 10.68.4.0/22 via 10.68.16.36
ip route add 10.68.16.40/29 via 10.68.16.36
ip route add 10.68.16.68/30 via 10.68.16.36

ip route add 10.68.12.0/24 via 10.68.16.62
ip route add 10.68.13.0/24 via 10.68.16.62
ip route add 10.68.15.64/26 via 10.68.16.62

ip route add 10.68.10.0/23 via 10.68.16.66
ip route add 10.68.14.128/25 via 10.68.16.66
ip route add 10.68.15.0/26 via 10.68.16.66
ip route add 10.68.15.128/26 via 10.68.16.66
ip route add 10.68.16.0/27 via 10.68.16.66
ip route add 10.68.16.48/29 via 10.68.16.66
ip route add 10.68.16.72/30 via 10.68.16.66 # A16
ip route add 10.68.16.76/30 via 10.68.16.66 # A18
ip route add 10.68.16.80/30 via 10.68.16.66 # A20
ip route add 10.68.16.84/30 via 10.68.16.66 # A22
ip route add 10.68.16.88/30 via 10.68.16.66 # A24
