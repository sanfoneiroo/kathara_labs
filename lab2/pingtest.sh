#!/usr/bin/env bash

echo "teste de ping inter vlans"
kathara exec pc10 -- ping -c 3 192.168.10.11
kathara exec pc12 -- ping -c 3 192.168.20.13
kathara exec dhcp -- ping -c 3 172.16.9.3

echo "teste de ping entre vlans"
kathara exec pc10 -- ping -c 3 192.168.20.13
kathara exec pc12 -- ping -c 3 192.168.10.15

echo "teste de ping para servidores"
kathara exec pc10 -- ping -c 3 172.16.9.3
kathara exec pc12 -- ping -c 3 172.16.9.3