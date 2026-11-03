#!/bin/bash
ip addr flush dev eth0
ip addr add 10.68.4.2/22 dev eth0
ip link set eth0 up
ip route add default via 10.68.4.1
