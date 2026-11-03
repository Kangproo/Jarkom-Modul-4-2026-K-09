#!/bin/bash
ip addr flush dev eth0
ip addr add 10.68.15.3/26 dev eth0
ip link set eth0 up
ip route add default via 10.68.15.1
