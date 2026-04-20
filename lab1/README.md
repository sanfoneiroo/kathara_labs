# Laboratório de Conectividade Básica com Kathara

Este laboratório apresenta uma topologia mínima de rede utilizando o **Kathara** para emulação de hosts em containers.  
O objetivo é aprender a configurar interfaces de rede manualmente e automatizar a execução de comandos utilizando **scripts Bash**.

## Topologia

A rede é composta por dois hosts conectados na mesma rede local.
pc1 -------- pc2

Os endereços IP configurados são:

| Host | Endereço IP |
|-----|-----|
| pc1 | 192.168.0.1/24 |
| pc2 | 192.168.0.2/24 |

Ambos os dispositivos pertencem à mesma sub-rede e comunicam-se diretamente sem a necessidade de roteamento.

## Tecnologias utilizadas

A solução foi implementada utilizando ferramentas do ecossistema Linux:

- **Kathara** para emulação do ambiente de rede  
- **Docker containers** como hosts da topologia  
- **Linux networking tools** (`ip addr`)  
- **Bash scripting** para automação da configuração  
- **ICMP (ping)** para validação de conectividade  

## Resultado

Após a configuração dos endereços IP, os dois hosts conseguem se comunicar diretamente através da rede local.

Este laboratório demonstra:

- configuração básica de interfaces de rede em Linux  
- execução de comandos dentro de containers com `kathara exec`  
- validação de conectividade utilizando `ping`