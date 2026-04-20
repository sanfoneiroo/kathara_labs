#!/usr/bin/env bash

echo "configurando IPs dos PCs"
kathara exec pc1 -- ip addr add 172.16.1.9/24 dev eth0
kathara exec pc1 -- ip route add default via 172.16.1.1
kathara exec pc2 -- ip addr add 172.16.2.9/24 dev eth0
kathara exec pc2 -- ip route add default via 172.16.2.1

echo "configurando IPs dos roteadores"
kathara exec router1 -- ip addr add 172.16.1.1/24 dev eth1
kathara exec router1 -- ip addr add 172.16.4.1/24 dev eth0
kathara exec router2 -- ip addr add 172.16.2.1/24 dev eth1
kathara exec router2 -- ip addr add 172.16.4.2/24 dev eth0

echo "habilitando roteamento"
kathara exec router1 -- sysctl -w net.ipv4.ip_forward=1
kathara exec router2 -- sysctl -w net.ipv4.ip_forward=1

echo "criando rotas estáticas"
kathara exec router1 -- ip route add 172.16.2.0/24 via 172.16.4.2
kathara exec router2 -- ip route add 172.16.1.0/24 via 172.16.4.1