#!/bin/bash
ip addr flush dev eth0
ip addr add 10.68.0.3/22 dev eth0
ip link set eth0 up
ip route add default via 10.68.0.1
