#!/bin/bash

i=1
max=0
row=22
while [ $i -ne 6 ]
    do
    
    timeout=0

    if [ $i -eq 1 ]
    then
        max=100
    elif [ $i -eq 2 ]
    then
        max=400
    elif [ $i -eq 3 ]
    then
        max=180
    elif [ $i -eq 4 ]
    then
        max=200
    elif [ $i -eq 5 ]
    then
        max=200
    fi   

    while [ $timeout -le $max ]
        do
        echo "Processing wl$i with timeout=$timeout..."
        echo
        
        s="./dpm_simulator -t $timeout -psm example/psm.txt -wl workloads/uncorrelated/wl$i.txt > standardVersion/case$i/Tto_idle_[$timeout].txt"
        eval $s

        echo
        echo

        echo "Reading from file Tto_idle_[$timeout].txt for case $i..." 
        echo
        s=$(head -$row "standardVersion/case$i/Tto_idle_[$timeout].txt" | tail -1)

        p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')

        echo $p $timeout >> "standardVersion/case$i/energy_saved_case${i}_Tto_idle[0-$max].txt"

        let timeout+=5
    done
let i+=1
done
