#!/usr/bin/env bash

echo "criando a bridge nos switches 1 e 2"
kathara exec sw1 -- ip link add br0 type bridge vlan_filtering 1
kathara exec sw2 -- ip link add br0 type bridge vlan_filtering 1
kathara exec sw1 -- ip link set br0 up
kathara exec sw2 -- ip link set br0 up

echo "criando bridge no sw3"
kathara exec sw3 -- ip link add br0 type bridge vlan_filtering 1
kathara exec sw3 -- ip link set br0 up

echo "adicionando interfaces a bridge sw1"
kathara exec sw1 -- ip link set eth0 master br0
kathara exec sw1 -- ip link set eth1 master br0
kathara exec sw1 -- ip link set eth2 master br0
kathara exec sw1 -- ip link set eth3 master br0
kathara exec sw1 -- ip link set eth4 master br0
kathara exec sw1 -- ip link set eth5 master br0
kathara exec sw1 -- ip link set eth6 master br0

echo "adicionando interfaces a bridge sw2"
kathara exec sw2 -- ip link set eth0 master br0
kathara exec sw2 -- ip link set eth1 master br0
kathara exec sw2 -- ip link set eth2 master br0
kathara exec sw2 -- ip link set eth3 master br0
kathara exec sw2 -- ip link set eth4 master br0

echo "adicionando interfaces à bridge sw3"
kathara exec sw3 -- ip link set eth0 master br0
kathara exec sw3 -- ip link set eth1 master br0
kathara exec sw3 -- ip link set eth2 master br0
kathara exec sw3 -- ip link set eth3 master br0

echo "limpando vlans antigas no sw1"
kathara exec sw1 -- bridge vlan del dev eth0 vid 1
kathara exec sw1 -- bridge vlan del dev eth1 vid 1
kathara exec sw1 -- bridge vlan del dev eth2 vid 1
kathara exec sw1 -- bridge vlan del dev eth3 vid 1
kathara exec sw1 -- bridge vlan del dev eth4 vid 1
kathara exec sw1 -- bridge vlan del dev eth5 vid 1
kathara exec sw1 -- bridge vlan del dev eth6 vid 1

echo "limpando vlans antigas no sw2"
kathara exec sw2 -- bridge vlan del dev eth0 vid 1
kathara exec sw2 -- bridge vlan del dev eth1 vid 1
kathara exec sw2 -- bridge vlan del dev eth2 vid 1
kathara exec sw2 -- bridge vlan del dev eth3 vid 1
kathara exec sw2 -- bridge vlan del dev eth4 vid 1

echo "limpando vlans antigas no sw3"
kathara exec sw3 -- bridge vlan del dev eth0 vid 1
kathara exec sw3 -- bridge vlan del dev eth1 vid 1
kathara exec sw3 -- bridge vlan del dev eth2 vid 1
kathara exec sw3 -- bridge vlan del dev eth3 vid 1

echo "configurando vlans no sw1"
kathara exec sw1 -- bridge vlan add dev eth0 vid 10 pvid untagged
kathara exec sw1 -- bridge vlan add dev eth1 vid 10 pvid untagged
kathara exec sw1 -- bridge vlan add dev eth2 vid 20 pvid untagged
kathara exec sw1 -- bridge vlan add dev eth4 vid 10 pvid untagged
kathara exec sw1 -- bridge vlan add dev eth5 vid 20 pvid untagged
kathara exec sw1 -- bridge vlan add dev eth6 vid 99 pvid untagged

echo "configurando vlans no sw2"
kathara exec sw2 -- bridge vlan add dev eth0 vid 20 pvid untagged
kathara exec sw2 -- bridge vlan add dev eth1 vid 20 pvid untagged
kathara exec sw2 -- bridge vlan add dev eth2 vid 10 pvid untagged
kathara exec sw2 -- bridge vlan add dev eth4 vid 99 pvid untagged

echo "configurando VLANs dos servidores"
kathara exec sw3 -- bridge vlan add dev eth0 vid 99 pvid untagged
kathara exec sw3 -- bridge vlan add dev eth1 vid 99 pvid untagged
kathara exec sw3 -- bridge vlan add dev eth2 vid 99 pvid untagged

echo "configurando porta tronco sw1"
kathara exec sw1 -- bridge vlan add dev eth3 vid 10
kathara exec sw1 -- bridge vlan add dev eth3 vid 20
kathara exec sw1 -- bridge vlan add dev eth3 vid 99

echo "configurando porta tronco sw2"
kathara exec sw2 -- bridge vlan add dev eth3 vid 10
kathara exec sw2 -- bridge vlan add dev eth3 vid 20
kathara exec sw2 -- bridge vlan add dev eth3 vid 99
kathara exec sw2 -- bridge vlan add dev eth4 vid 99 pvid untagged

echo "configurando porta tronco sw3"
kathara exec sw3 -- bridge vlan add dev eth3 vid 99 pvid untagged

echo "verificando configuração de vlans no sw1"
kathara exec sw1 -- bridge vlan show
echo "verificando configuração de vlans no sw2"
kathara exec sw2 -- bridge vlan show
echo "verificando VLANs no sw3"
kathara exec sw3 -- bridge vlan show