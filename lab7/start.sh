#!/bin/bash

echo "Iniciando laboratório 7"

kathara lstart

sleep 2

echo "Conectando NAT à bridge"

CONTAINER=$(docker ps --format "{{.ID}} {{.Names}}" | grep "nat" | awk '{print $1}')

docker network connect bridge "$CONTAINER"

echo "NAT conectado"