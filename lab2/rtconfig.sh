#!/usr/bin/env bash

echo "ativando interfaces"
kathara exec router -- ip link set eth0 up
kathara exec router -- ip link set eth1 up
kathara exec router -- ip link set eth2 up

echo "configurando gateway das VLANs"
kathara exec router -- ip addr add 192.168.10.1/24 dev eth0
kathara exec router -- ip addr add 192.168.20.1/24 dev eth1
kathara exec router -- ip addr add 172.16.9.1/24 dev eth2

echo "habilitando roteamento"
kathara exec router -- sysctl -w net.ipv4.ip_forward=1

echo "verificando configuração do roteador"
kathara exec router -- sysctl net.ipv4.ip_forward
kathara exec router -- ip -br addr
kathara exec router -- ip -br route
