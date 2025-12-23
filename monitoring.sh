#!/bin/bash

#Memory usage
MUSED=$(free --mega | awk '$1 == "Mem:" {print $3}')
MTOTAL=$(free --mega | awk '$1 == "Mem:" {print $2}')
MPERC=$(free --mega | awk '$1 == "Mem:" {printf("(%.2f%%)\n", $3/$2*100)}')

#Disk usage
DUSED=$(df -h --block-size=G --total | tail -n 1 | awk '{print $3}' | cut -d G -f1)
DTOTAL=$(df -h --block-size=G --total | tail -n 1 | awk '{print $2}')
DPERC=$(df -h --block-size=G --total |tail -n 1 |  awk '{use += $3} {total += $2} END {printf("(%d%%)\n"), use/total*100}')

wall "
#Arch: $(uname -a)
#CPU physical: $(grep "physical id" /proc/cpuinfo | wc -l)
#vCPU: $(grep "processor" /proc/cpuinfo | wc -l)
#Memory Usege: ${MUSED}/${MTOTAL}MB ${MPERC}
#Disk Usage: ${DUSED}/${DTOTAL}B ${DPERC}
#CPU Load: $(top -b -n1 | grep "Cpu(s)" | awk '{printf "%.1f%%", $2+$4}')
#Last boot: $(who -b | awk '$1 == "system" {print $3" "$4}')
#LVM use: $(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)
#Connections TCP: $(ss -ta | grep ESTAB | wc -l | awk '$1 > 0 {printf("%d ESTABILSHED\n", $1)}')
#User log: $(users | wc -w)
#Network: $(hostname -I) ($(ip link | grep "link/ether" | awk '{print $2}'))
#Sudo: $(journalctl -q _COMM=sudo | grep COMMAND | wc -l) cmd"
