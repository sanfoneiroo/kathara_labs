#!/usr/bin/env bash

echo "teste de ping entre os hosts"
kathara exec pc1 -- ping -c 3 172.16.2.9
kathara exec pc2 -- ping -c 3 172.16.1.9

echo "tabelas de roteamento IPv4"
kathara exec router1 -- route -n
kathara exec router2 -- route -n