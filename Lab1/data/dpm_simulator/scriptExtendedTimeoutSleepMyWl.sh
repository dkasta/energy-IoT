#!/bin/bash

#Run script as:
# ./script_part2 id idle

id=$1
idle=$2
max=500
row=22
row_run=15
row_idle=16
row_sleep=17
timeout=0

while [ $timeout -le $max ]
    do
    echo "Processing my_wl with Tidle=$idle and Tsleep=$timeout..." 
    echo
    
    s="./dpm_simulator -t $idle $timeout  -psm example/psm_extended.txt -wl workloads/my_wl/my_wl.txt > extendedTimeoutSleepCorrelated/my_wl/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt"
    
    eval $s

    echo
    echo

    echo "Reading from file Tto_idle_$idle.txt for my_wl..." 
    echo

    #Energy statistics
    s=$(head -$row "extendedTimeoutSleepCorrelated/my_wl/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "extendedTimeoutSleepCorrelated/my_wl/Tto_idle_$idle/energy_saved_my_wl_Tto_idle_[$idle]_Tto_sleep_[0-$max].txt"

    #Total time in run state
    s=$(head -$row_run "extendedTimeoutSleepCorrelated/my_wl/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "extendedTimeoutSleepCorrelated/my_wl/Tto_idle_$idle/energy_saved_my_wl_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_run.txt"

    #Total time in idle state
    s=$(head -$row_idle "extendedTimeoutSleepCorrelated/my_wl/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "extendedTimeoutSleepCorrelated/my_wl/Tto_idle_$idle/energy_saved_my_wl_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_idle.txt"

    #Total time in sleep state
    s=$(head -$row_sleep "extendedTimeoutSleepCorrelated/my_wl/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "extendedTimeoutSleepCorrelated/my_wl/Tto_idle_$idle/energy_saved_my_wl_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_sleep.txt"


    let timeout+=5
done

