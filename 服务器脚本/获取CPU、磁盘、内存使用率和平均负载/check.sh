#!/bin/bash
CPU=`top -bn 1 -i -c | sed -n '3p' | awk -F ':' '{print$2}' | awk '{print$1}'`
MEM=`free -m | sed -n '2p' | awk '{printf ("%.1f\n",$3/$2*100)}'`
IOI=`df -h | grep "/" | head -n 1 | awk '{print$(NF-1)}'`
 
load1=`uptime | awk -F ':' '{print$5}' | awk -F ',' '{print$1}' | awk -F '.' '{print$1}'`
load2=`uptime | awk -F ':' '{print$5}' | awk -F ',' '{print$2}' | awk -F '.' '{print$1}'`
load3=`uptime | awk -F ':' '{print$5}' | awk -F ',' '{print$3}' | awk -F '.' '{print$1}'`
 
ICPU=`echo $CPU | awk '{printf ("%.2f\n",$MEM/100)}'`
IMEM=`echo $MEM | awk '{printf ("%.2f\n",$MEM/100)}'`
IIII=`echo $IOI | awk -F '%' '{print$1}'`
IIIO=`echo $IIII | awk '{printf ("%.2f\n",$IIII/100)}'`
 
###########################################################################
 
loa2(){
    if [ $load1 -lt 3 ];then
        lo1="NICE"
    else
        lo1="BAD"
    fi
    if [ $load2 -lt 3 ];then
        lo2="NICE"
    else
        lo2="BAD"
    fi
    if [ $load3 -lt 3 ];then
        lo3="NICE"
    else
        lo3="BAD"
    fi
    if [ $load1 -gt 3 -a $load1 -lt 10 ];then
        lo1="LOAD!!"
    fi
    if [ $load2 -gt 3 -a $load2 -lt 10 ];then
        lo2="LOAD!!"
    fi
    if [ $load3 -gt 3 -a $load3 -lt 10 ];then
        lo3="LOAD!!"
    fi
}
loa2
load=`uptime | awk -F ':' '{print$5}'`
echo 1min, 10min,15min
echo $load
echo -e "\033[32;5m$lo1 \033[0m" "\033[32;5m$lo2 \033[0m" "\033[32;5m$lo3 \033[0m"
echo -e "\033[31;5m${ICPU} \033[0m" ${CPU}:CPU-Used
echo -e "\033[33;5m${IMEM} \033[0m" ${MEM}:MEM-Used
echo -e "\033[34;5m${IIIO} \033[0m" ${IOI}:IOI-Used