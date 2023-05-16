#!/bin/bash


id=$1
idle=$2
row=25
row_run=18
row_idle=19
row_sleep=20
timeout=0
max=500

k1=-6.68e-06
k2=0.9883
k3=10.25

while [ $timeout -le $max ]
    do
    echo "Processing custom wl$id with Tidle=$idle and Tsleep=$timeout..." 
    echo
    
    s="./dpm_simulator -h $k1 $k2 $k3 $idle $timeout -psm example/psm_history.txt -wl workloads/my_wl/my_wl.txt > historyPrediction/my_wl/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt"
    
    eval $s

    echo
    echo

    echo "Reading from file Tto_idle_$idle.txt for my_wl..." 
    echo

    #Energy statistics
    s=$(head -$row "historyPrediction/my_wl/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPrediction/my_wl/Tto_idle_$idle/energy_saved_my_wl_Tto_idle_[$idle]_Tto_sleep_[0-$max].txt"

    #Total time in run state
    s=$(head -$row_run "historyPrediction/my_wl/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPrediction/my_wl/Tto_idle_$idle/energy_saved_my_wl_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_run.txt"

    #Total time in idle state
    s=$(head -$row_idle "historyPrediction/my_wl/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPrediction/my_wl/Tto_idle_$idle/energy_saved_my_wl_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_idle.txt"

    #Total time in sleep state
    s=$(head -$row_sleep "historyPrediction/my_wl/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPrediction/my_wl/Tto_idle_$idle/energy_saved_my_wl_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_sleep.txt"


    let timeout+=5
done

