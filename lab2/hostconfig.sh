#!/usr/bin/env bash

echo "configurando IPs para subrede 10"
kathara exec pc10 -- ip addr add 192.168.10.10/24 dev eth0
kathara exec pc10 -- ip route add default via 192.168.10.1
kathara exec pc11 -- ip addr add 192.168.10.11/24 dev eth0
kathara exec pc11 -- ip route add default via 192.168.10.1
kathara exec pc15 -- ip addr add 192.168.10.15/24 dev eth0
kathara exec pc15 -- ip route add default via 192.168.10.1

echo "configurando IPs para subrede 20"
kathara exec pc12 -- ip addr add 192.168.20.12/24 dev eth0
kathara exec pc12 -- ip route add default via 192.168.20.1
kathara exec pc13 -- ip addr add 192.168.20.13/24 dev eth0
kathara exec pc13 -- ip route add default via 192.168.20.1
kathara exec pc14 -- ip addr add 192.168.20.14/24 dev eth0
kathara exec pc14 -- ip route add default via 192.168.20.1

echo "configurando IPs do servidores"
kathara exec dhcp -- ip addr add 172.16.9.2/24 dev eth0
kathara exec dhcp -- ip route add default via 172.16.9.1
kathara exec dns -- ip addr add 172.16.9.3/24 dev eth0
kathara exec dns -- ip route add default via 172.16.9.1
kathara exec web -- ip addr add 172.16.9.4/24 dev eth0
kathara exec web -- ip route add default via 172.16.9.1

