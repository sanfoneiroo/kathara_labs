# Laboratório de VLAN e Inter-VLAN Routing com Kathara

Este laboratório implementa uma topologia de rede segmentada utilizando VLANs e roteamento entre VLANs (Inter-VLAN Routing).  
O objetivo é reproduzir, em um ambiente Linux real, um cenário comum de redes corporativas normalmente explorado em simuladores como Packet Tracer.

## Topologia

A rede é composta por:

- 3 switches de camada 2  
- 1 roteador responsável pelo roteamento entre VLANs  
- múltiplos hosts clientes  
- uma rede dedicada para servidores  

As VLANs são distribuídas da seguinte forma:

| VLAN | Rede | Função |
|-----|-----|-----|
| 10 | 192.168.10.0/24 | Clientes |
| 20 | 192.168.20.0/24 | Clientes |
| 99 | 172.16.9.0/24 | Servidores |

Os switches são interligados por **links trunk**, permitindo o transporte de múltiplas VLANs entre eles.  
O roteador possui uma interface conectada a cada rede e atua como **gateway padrão**, realizando o roteamento entre as VLANs.

## Tecnologias utilizadas

A solução foi implementada utilizando ferramentas e recursos do ecossistema Linux:

- **Kathara** para emulação do laboratório de rede  
- **Docker containers** como nós da topologia  
- **Linux networking tools** (`ip`, `bridge`, `sysctl`)  
- **VLAN 802.1Q** com bridge VLAN filtering  
- **Bash scripting** para automação da configuração  
- **ICMP (ping)** para validação de conectividade  

## Resultado

Após a configuração:

- Hosts dentro da mesma VLAN comunicam-se normalmente.
- Hosts de VLANs diferentes conseguem se comunicar através do roteador.
- A segmentação da rede foi validada através de testes de conectividade (`ping`).

## Créditos

A topologia utilizada neste laboratório foi apresentada pelo **Professor Gustavo Kalau** na **Aula 5 do curso Redes Mão na Massa 2.0**.  
Este projeto consiste em uma adaptação da proposta original para um ambiente baseado em **Kathara, Docker e ferramentas de rede do Linux**, com configuração automatizada por scripts Bash.