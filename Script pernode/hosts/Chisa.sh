#!/bin/bash
ip addr flush dev eth0
ip addr add 10.68.15.130/26 dev eth0
ip link set eth0 up
ip route add default via 10.68.15.129
