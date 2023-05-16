#!/bin/bash

i=1
max=500
row=22
while [ $i -ne 3 ]
    do
    
    timeout=0

    while [ $timeout -le $max ]
        do
        echo "Processing custom wl$i with timeout=$timeout..."
        echo
        
        s="./dpm_simulator -t $timeout -psm example/psm.txt -wl workloads/custom/custom_workload_$i.txt > standardVersion/customWl$i/Tto_idle_[$timeout].txt"
        eval $s

        echo
        echo

        echo "Reading from file Tto_idle_[$timeout].txt for case $i..." 
        echo
        s=$(head -$row "standardVersion/customWl$i/Tto_idle_[$timeout].txt" | tail -1)

        p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')

        echo $p $timeout >> "standardVersion/customWl$i/energy_saved_case${i}_Tto_idle[0-$max].txt"

        let timeout+=5
    done
let i+=1
done
