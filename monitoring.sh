#!/bin/bash

echo "#Arquitetura: $(uname -a)"
echo "#CPU fisica: $(grep "physical id" /proc/cpuinfo | wc -l)"
echo "#vCPU: $(grep "processor" /proc/cpuinfo | wc -l)"
echo "#Uso de memoria: $(free --mega | awk '$1 == "Mem:" {print $3}')"
echo "#Uso de disco: $()"
echo "#Carga do CPU: $()"
echo "#Ultima inicializaçao: $()"
echo "#Uso de LVM: $()"
echo "#Conexoes TCP: $()"
echo "#Log do usuario: $()"
echo "#Rede: $()"
echo "#Sudo: $()"
