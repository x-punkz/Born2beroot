#!/bin/bash

#Memory usage
MUSED=$(free --mega | awk '$1 == "Mem:" {print $3}')
MTOTAL=$(free --mega | awk '$1 == "Mem:" {print $2}')
MPERC=$(free --mega | awk '$1 == "Mem:" {printf("(%.2f%%)\n", $3/$2*100)}')

#Disk usage
DUSED=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{memory_use += $3} END {print memory_use}')
DTOTAL=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{memory_total += $2} END {print memory_total}')
DPERC=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{use += $3} {total += $2} END {printf("(%d%%)\n"), use/total*100}')

echo "#Arquitetura: $(uname -a)"
echo "#CPU fisica: $(grep "physical id" /proc/cpuinfo | wc -l)"
echo "#vCPU: $(grep "processor" /proc/cpuinfo | wc -l)"
echo "#Uso de memoria: ${MUSED}/${MTOTAL}MB ${MPERC}"
echo "#Uso de disco: ${DUSED}/${DTOTAL}GB ${DPERC}"
echo "#Carga do CPU: $(top -b -n1 | grep "Cpu(s)" | awk '{printf "%.1f%%", $2+$4}')"
echo "#Última inicialização: $(who -b | awk '$1 == "system" {print $3" "$4}')"
echo "#Uso de LVM: $(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)"
echo "#Conexões TCP: $(ss -ta | grep ESTAB | wc -l | awk '$1 > 0 {printf("%d ESTABILSHED\n", $1)}')"
echo "#Log do usuário: $(users | wc -w)"
echo "#Rede: $(hostname -I) ($(ip link | grep "link/ether" | awk '{print $2}'))"
echo "Sudo: $(journalctl -q _COMM=sudo | grep COMMAND | wc -l) cmd"

