#!/usr/bin/env bash

LOG=shared/arp.txt
date >> "$LOG"

echo "===== populando ARP ====="
kathara exec router1 -- ping 192.168.10.10 -c 1
kathara exec router1 -- ping 192.168.10.11 -c 1 
kathara exec router1 -- ping 192.168.10.12 -c 1
kathara exec router1 -- ping 192.168.20.13 -c 1
kathara exec router1 -- ping 192.168.20.14 -c 1
kathara exec router1 -- ping 192.168.20.15 -c 1

echo "===== ARP router =====" >> $LOG 
kathara exec router1 -- arp -n >> $LOG

echo >> "$LOG"
echo "===== FIM =====" >> "$LOG"
echo >> "$LOG"

echo "exibindo resultados"
cat shared/arp.txt