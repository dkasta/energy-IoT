#!/bin/bash


id=$1
idle=$2
row=24
row_run=17
row_idle=18
row_sleep=19
timeout=0
max=500

if [ $id -eq 1 ]
then
  k1=0.001497
  k2=256
elif [ $id -eq 2 ]
then
  k1=0.3339
  k2=130.8
fi

while [ $timeout -le $max ]
    do
    echo "Processing custom wl$id with Tidle=$idle and Tsleep=$timeout..." 
    echo
    
    s="./dpm_simulator -h $k1 $k2 $idle $timeout -psm example/psm_history.txt -wl workloads/custom/custom_workload_$id.txt > historyPredictionFitV1/custom/wl$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt"
    
    eval $s

    echo
    echo

    echo "Reading from file Tto_idle_$idle.txt for custom wl$id..." 
    echo

    #Energy statistics
    s=$(head -$row "historyPredictionFitV1/custom/wl$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPredictionFitV1/custom/wl$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max].txt"

    #Total time in run state
    s=$(head -$row_run "historyPredictionFitV1/custom/wl$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPredictionFitV1/custom/wl$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_run.txt"

    #Total time in idle state
    s=$(head -$row_idle "historyPredictionFitV1/custom/wl$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPredictionFitV1/custom/wl$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_idle.txt"

    #Total time in sleep state
    s=$(head -$row_sleep "historyPredictionFitV1/custom/wl$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPredictionFitV1/custom/wl$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_sleep.txt"


    let timeout+=5
done

