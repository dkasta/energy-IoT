#!/bin/bash


id=$1
idle=$2
row=26
row_run=19
row_idle=20
row_sleep=21
timeout=0
max=500

if [ $id -eq 1 ]
then
  k1=1.559e-05
  k2=-0.01199
  k3=3.045
  k4=0.8927
elif [ $id -eq 2 ]
then
  k1=-2.868e-07
  k2=0.0001985
  k3=0.2929
  k4=133.2
fi

while [ $timeout -le $max ]
    do
    echo "Processing custom wl$id with Tidle=$idle and Tsleep=$timeout..." 
    echo
    
    s="./dpm_simulator -h $k1 $k2 $k3 $k4 $idle $timeout -psm example/psm_history.txt -wl workloads/custom/custom_workload_$id.txt > historyPredictionFitV2/custom/wl$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt"
    
    eval $s

    echo
    echo

    echo "Reading from file Tto_idle_$idle.txt for custom wl$id..." 
    echo

    #Energy statistics
    s=$(head -$row "historyPredictionFitV2/custom/wl$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPredictionFitV2/custom/wl$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max].txt"

    #Total time in run state
    s=$(head -$row_run "historyPredictionFitV2/custom/wl$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPredictionFitV2/custom/wl$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_run.txt"

    #Total time in idle state
    s=$(head -$row_idle "historyPredictionFitV2/custom/wl$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPredictionFitV2/custom/wl$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_idle.txt"

    #Total time in sleep state
    s=$(head -$row_sleep "historyPredictionFitV2/custom/wl$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPredictionFitV2/custom/wl$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_sleep.txt"


    let timeout+=5
done

