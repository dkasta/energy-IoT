#!/bin/bash

#Run script as:
# ./script_part2 id idle


# meaningful superior limit for energy statistics
# case1: max=100
# case2: max=400
# case3: max=180
# case4: max=200
# case5: max=200


id=$1
idle=$2
row=22
row_run=15
row_idle=16
row_sleep=17
timeout=0
max=0
if [ $id -eq 1 ]
then
    max=100
elif [ $id -eq 2 ]
then
    max=400
elif [ $id -eq 3 ]
then
    max=180
elif [ $id -eq 4 ]
then
    max=200
elif [ $id -eq 5 ]
then
    max=200
fi

while [ $timeout -le $max ]
    do
    echo "Processing wl$id with Tidle=$idle and Tsleep=$timeout..." 
    echo
    
    s="./dpm_simulator -t $idle $timeout  -psm example/psm_extended.txt -wl workloads/correlated/wl$id.txt > extendedTimeoutSleepCorrelated/case$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt"
    
    eval $s

    echo
    echo

    echo "Reading from file Tto_idle_$idle.txt for case $id..." 
    echo

    #Energy statistics
    s=$(head -$row "extendedTimeoutSleepCorrelated/case$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')

    echo $p $timeout >> "extendedTimeoutSleepCorrelated/case$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max].txt"

    #Total time in run state
    s=$(head -$row_run "extendedTimeoutSleepCorrelated/case$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "extendedTimeoutSleepCorrelated/case$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_run.txt"

    #Total time in idle state
    s=$(head -$row_idle "extendedTimeoutSleepCorrelated/case$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "extendedTimeoutSleepCorrelated/case$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_idle.txt"

    #Total time in sleep state
    s=$(head -$row_sleep "extendedTimeoutSleepCorrelated/case$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "extendedTimeoutSleepCorrelated/case$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_sleep.txt"


    let timeout+=5
done

