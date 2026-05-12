#!/bin/bash

echo "Testando conectividade entre PC1 e R1"
kathara exec pc1 -- ping -c 3 192.168.0.1

echo "Testando conectividade entre PC1 e NAT"
kathara exec pc1 -- ping -c 3 10.0.0.1

echo "Testando conectividade entre PC1 e internet (Google DNS)"
kathara exec pc1 -- ping -c 3 8.8.8.8