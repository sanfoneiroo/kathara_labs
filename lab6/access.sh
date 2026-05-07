#!/bin/sh

echo "Acessando servidor NAS"
kathara exec server1 -- ls -l /share
echo "------------------------------"

echo "Lendo arquivo de log do servidor NAS"
kathara exec server1 -- cat /share/startup.txt
echo "------------------------------"

echo "Lendo arquivo de log do PC1"
kathara exec pc1 -- cat /tmp/log_PC1.txt
echo "------------------------------"

echo "Lendo arquivo de log do PC2"
kathara exec pc2 -- cat /tmp/log_PC2.txt