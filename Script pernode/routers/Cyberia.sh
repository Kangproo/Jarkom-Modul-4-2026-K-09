#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth1
ip addr flush dev eth2

ip addr add 10.68.14.1/25 dev eth1
ip link set eth1 up

ip addr add 10.68.16.57/30 dev eth2
ip link set eth2 up

udhcpc -i eth0 || dhclient eth0

iptables -t nat -F
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

ip route add 10.68.0.0/20 via 10.68.16.58
