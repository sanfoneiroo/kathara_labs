#!/usr/bin/env bash

echo "rodando tcpdump para capturar tráfego entre pc1 e pc2"
kathara exec pc1 -- tcpdump -s 0 -i eth0 -w shared/captura_pc1.pcap &
kathara exec pc2 -- tcpdump -s 0 -i eth0 -w shared/captura_pc2.pcap &

echo "pc1: ping pc2"
kathara exec pc1 -- ping -c 4 10.0.0.2
echo "pc2: ping pc1"
kathara exec pc2 -- ping -c 4 10.0.0.1

echo "parando tcpdump"
kathara exec pc1 -- pkill tcpdump
kathara exec pc2 -- pkill tcpdump

echo "analisando captura do pc1"
tcpdump -r shared/captura_pc1.pcap -n -e
echo "analisando captura do pc2"
tcpdump -r shared/captura_pc2.pcap -n -e