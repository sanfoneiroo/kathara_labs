#!/usr/bin/env bash

LOG=shared/topologia.txt
date >> "$LOG"

echo "===== CAMADA 1 =====" >> "$LOG"
cat lab.conf >> $LOG
echo >> $LOG

echo "registrando interfaces dos hosts pc10 a pc15"

for i in $(seq 10 15); do
    echo "===== pc$i interface =====" >> "$LOG"
    kathara exec pc$i -- ip address show dev eth0 >> "$LOG"
    echo >> "$LOG"
done

echo "registrando interfaces do roteador"
echo "===== router interfaces =====" >> "$LOG"
echo >> "$LOG"
kathara exec router1 -- ip address show dev eth0 >> "$LOG"
echo >> "$LOG"
kathara exec router1 -- ip address show dev eth1 >> "$LOG"

echo "registrando tabela de roteamento do roteador"
echo >> "$LOG"
echo "===== router1 routing table =====" >> "$LOG"
kathara exec router1 -- ip route show >> "$LOG"

echo >> "$LOG"
echo "===== FIM =====" >> "$LOG"
echo >> "$LOG"

echo "exibindo resultados"
cat shared/topologia.txt


