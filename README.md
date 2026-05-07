# Kathara Labs - Practical networking labs using Kathara, Docker and Linux networking tools.

Este repositório reúne uma coleção de **laboratórios de redes desenvolvidos com Kathara**, utilizando containers Docker e ferramentas de rede do Linux para reproduzir cenários práticos de configuração e diagnóstico de redes.

Os laboratórios são estruturados de forma progressiva, partindo de topologias simples até cenários mais próximos de redes corporativas. A configuração dos dispositivos é automatizada através de **scripts Bash**, permitindo reproduzir os experimentos de forma rápida e consistente.

## Tecnologias utilizadas

Os laboratórios utilizam principalmente ferramentas do ecossistema Linux:

- **Kathara** para emulação de ambientes de rede  
- **Docker containers** como dispositivos da topologia  
- **Linux networking tools** (`ip`, `bridge`, `sysctl`)  
- **Bash scripting** para automação das configurações  
- **ICMP (ping)** para validação de conectividade  

## Estrutura do repositório
├── lab1-basic-connectivity
├── lab2-vlan-intervlan-routing
├── lab3-static-routing
├── lab4-traffic-analysis
├── lab5-arp-observation
└── lab6-samba-nas

Cada diretório contém:

- definição da topologia (`lab.conf`)
- scripts de configuração
- README explicando o laboratório

## Laboratórios disponíveis

### Lab 1 – Conectividade básica

Topologia mínima com dois hosts na mesma rede, utilizada para introduzir o uso do **Kathara**, configuração de interfaces de rede e automação de comandos com scripts Bash.

### Lab 2 – VLAN e Inter-VLAN Routing

Topologia com múltiplos switches, segmentação por **VLAN**, links **trunk** e um roteador realizando **roteamento entre VLANs**.

### Lab 3 – Roteamento estático

Topologia composta por **dois roteadores e duas redes distintas**, conectadas por um link intermediário, utilizando **rotas estáticas** que permitem a comunicação entre hosts em redes diferentes através dos roteadores.

### Lab 4 – Análise de tráfego

Laboratório focado em captura e análise de pacotes utilizando **tcpdump** em uma topologia simples com dois hosts Linux conectados na mesma rede.

### Lab 5 – Observação de ARP

Laboratório dedicado à observação do funcionamento do protocolo **ARP (Address Resolution Protocol)** em uma topologia com múltiplos hosts distribuídos em duas sub-redes conectadas por um roteador Linux.

### Lab 6 – Servidor NAS com Samba

Implementação de um pequeno ambiente **NAS** utilizando Samba, containers Docker personalizados e automação com scripts Bash.