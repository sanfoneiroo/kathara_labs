#!/usr/bin/env bash

echo "configurando IPs"
kathara exec pc1 -- ip addr add 192.168.0.1/24 dev eth0
kathara exec pc2 -- ip addr add 192.168.0.2/24 dev eth0

echo "testando conectividade"
kathara exec pc1 -- ping -c 3 192.168.0.2
kathara exec pc2 -- ping -c 3 192.168.0.1
