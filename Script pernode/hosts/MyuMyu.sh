#!/bin/bash
ip addr flush dev eth0
ip addr add 10.68.14.3/25 dev eth0
ip link set eth0 up
ip route add default via 10.68.14.1
