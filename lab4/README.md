# Laboratório de Análise de Tráfego com Kathara

Este laboratório apresenta uma topologia mínima composta por dois hosts Linux conectados na mesma rede virtual.

O objetivo é demonstrar como:

- configurar interfaces automaticamente usando arquivos `.startup`
- gerar tráfego de rede com `ping`
- capturar pacotes com `tcpdump`
- registrar informações da rede em **logs automáticos**

Os resultados dos testes e as capturas de pacotes são gravados na pasta `shared`, permitindo análise posterior.

## Topologia

A rede é composta por dois hosts conectados diretamente na mesma LAN virtual.

pc1 ---- pc2

## Endereçamento da rede

| Host | Interface | Endereço |
|-----|-----|-----|
| pc1 | eth0 | 10.0.0.1/24 |
| pc2 | eth0 | 10.0.0.2/24 |

Como ambos estão na mesma rede, não é necessário configurar gateway.

## Tecnologias utilizadas

Este laboratório utiliza ferramentas comuns do ecossistema Linux:

- **Kathara** para emulação do laboratório de rede
- **Containers Linux** como nós da topologia
- **Linux networking tools** (`ip`)
- **tcpdump** para captura de pacotes
- **ICMP (ping)** para geração de tráfego
- **Bash scripting** para automação dos testes

## Execução dos testes

O script de teste executa automaticamente as seguintes etapas:

1. coleta informações das interfaces de rede
2. grava essas informações em um arquivo de log
3. inicia captura de pacotes em ambos os hosts
4. gera tráfego ICMP entre os hosts
5. encerra as capturas
6. analisa os arquivos `.pcap` gerados

As capturas são armazenadas em:
shared/captura_pc1.pcap
shared/captura_pc2.pcap

E o log das interfaces é salvo em:
shared/interfaces.txt


## Resultados esperados

Durante a execução do teste é possível observar:

- resolução **ARP** entre os hosts
- troca de **pacotes ICMP (echo request / echo reply)**
- cabeçalhos **Ethernet e IP** nas capturas de pacotes

Os arquivos `.pcap` podem ser analisados diretamente com:

```bash
tcpdump -r shared/captura_pc1.pcap -n -e
tcpdump -r shared/captura_pc2.pcap -n -e
```

Ou utilizando ferramentas gráficas como Wireshark.

## Estrutura do laboratório

lab/

lab.conf
pc1.startup
pc2.startup
capture.sh
interfaces.sh
shared/

lab.conf define a topologia da rede
.startup configura automaticamente os hosts
capture.sh e interfaces.sh executa os testes e gera logs
shared/ armazena capturas e resultados