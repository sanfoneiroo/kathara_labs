# Laboratório de Observação de ARP com Kathara

Este laboratório apresenta uma topologia composta por **seis hosts Linux e um roteador**, distribuídos em dois segmentos de rede.

O objetivo é demonstrar como:

- configurar **duas sub-redes IP**
- conectar redes através de um **roteador**
- observar o funcionamento do **ARP (Address Resolution Protocol)**
- registrar automaticamente informações da rede em **logs**

Durante o laboratório são coletadas informações sobre:

- topologia física do ambiente
- configuração das interfaces
- tabela de roteamento do roteador
- tabela ARP aprendida dinamicamente

Os resultados são gravados em arquivos de log para análise posterior.

---

# Topologia

A rede é composta por dois segmentos físicos conectados por um roteador.
Segmento A
pc10
pc11
pc12
router1

Segmento B
pc13
pc14
pc15
router1


Cada segmento está conectado a uma interface diferente do roteador.

---

# Endereçamento da rede

## Rede 192.168.10.0/24

| Host | Interface | Endereço |
|-----|-----|-----|
| router1 | eth0 | 192.168.10.1 |
| pc10 | eth0 | 192.168.10.10 |
| pc11 | eth0 | 192.168.10.11 |
| pc12 | eth0 | 192.168.10.12 |

## Rede 192.168.20.0/24

| Host | Interface | Endereço |
|-----|-----|-----|
| router1 | eth1 | 192.168.20.1 |
| pc13 | eth0 | 192.168.20.13 |
| pc14 | eth0 | 192.168.20.14 |
| pc15 | eth0 | 192.168.20.15 |

O roteador conecta as duas redes e permite comunicação entre elas.

---

# Tecnologias utilizadas

Este laboratório utiliza ferramentas comuns do ecossistema Linux:

- **Kathara** para emulação do laboratório de rede
- **Containers Linux** como nós da topologia
- **Linux networking tools** (`ip`)
- **ARP** para resolução de endereços IP para MAC
- **Bash scripting** para automação da coleta de informações

---

# Execução dos testes

O script de coleta executa automaticamente as seguintes etapas:

1. registra a **topologia física da camada 1**
2. coleta informações das **interfaces de todos os hosts**
3. registra a **tabela de roteamento do roteador**
4. consulta a **tabela ARP do roteador**
5. grava todos os resultados em arquivos de log

Essas informações permitem observar como os endereços MAC são aprendidos dinamicamente pelo protocolo ARP.