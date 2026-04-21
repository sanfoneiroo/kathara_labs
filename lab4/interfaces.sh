#!/usr/bin/env bash

LOG=shared/interfaces.txt

echo "===== pc1 interface =====" >> $LOG
date >> $LOG
kathara exec pc1 -- ip address show dev eth0 >> $LOG

echo >> $LOG

echo "===== pc2 interface =====" >> $LOG
date >> $LOG
kathara exec pc2 -- ip address show dev eth0 >> $LOG

echo "analisando resultados"
cat shared/interfaces.txt