# Laboratório de Roteamento Estático com Kathara

Este laboratório implementa uma topologia simples composta por dois roteadores e duas redes distintas.  
O objetivo é demonstrar como configurar **roteamento estático** manualmente em um ambiente Linux real utilizando o **Kathara**.

Esse tipo de exercício ajuda a compreender conceitos fundamentais de redes, como:

- gateway padrão  
- redes diretamente conectadas  
- rotas estáticas  
- encaminhamento de pacotes entre sub-redes  

## Topologia

A rede é composta por:

- 2 hosts clientes  
- 2 roteadores Linux  
- 3 redes IPv4 distintas  

A estrutura lógica da rede é a seguinte:
pc1 ---- router1 ---- router2 ---- pc2


## Endereçamento da rede

| Rede | Endereçamento | Função |
|-----|-----|-----|
| 172.16.1.0/24 | pc1 ↔ router1 | Rede do host 1 |
| 172.16.2.0/24 | pc2 ↔ router2 | Rede do host 2 |
| 172.16.4.0/24 | router1 ↔ router2 | Link entre roteadores |

Cada host utiliza seu roteador local como **gateway padrão**.

Para que as redes possam se comunicar, os roteadores precisam conhecer as redes remotas através de **rotas estáticas**.

## Tecnologias utilizadas

A solução foi implementada utilizando ferramentas e recursos do ecossistema Linux:

- **Kathara** para emulação do laboratório de rede  
- **Docker containers** como nós da topologia  
- **Linux networking tools** (`ip`, `route`, `sysctl`)  
- **Roteamento IPv4 estático**  
- **Bash scripting** para automação da configuração  
- **ICMP (ping)** para validação de conectividade  

## Resultado

Após a configuração:

- Cada host consegue se comunicar com seu gateway local.
- Os roteadores encaminham pacotes entre as redes através das rotas estáticas.
- Os hosts conseguem se comunicar entre si utilizando **ICMP (ping)**.

A tabela de roteamento dos roteadores pode ser verificada com:
route -n
confirmando a presença das rotas estáticas configuradas.