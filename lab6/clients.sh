#!/bin/sh

echo "Criando arquivo de log para PC1"
kathara exec pc1 -- sh -c 'echo "PC1 acessou em $(date)" >> /tmp/log_PC1.txt'

echo "Criando arquivo de log para PC2"
kathara exec pc2 -- sh -c 'echo "PC2 acessou em $(date)" >> /tmp/log_PC2.txt'

echo "Enviando arquivo de log para o servidor SMB"
kathara exec pc1 -- sh -c 'smbclient //192.168.2.10/share -N \
-c "put /tmp/log_PC1.txt log_PC1.txt"'
kathara exec pc2 -- sh -c 'smbclient //192.168.2.10/share -N \
-c "put /tmp/log_PC2.txt log_PC2.txt"'

echo "Listando arquivos no compartilhamento SMB"
kathara exec pc1 -- sh -c 'smbclient //192.168.2.10/share -N \
-c "ls"'