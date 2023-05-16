#!/bin/bash

#Run script as:
# ./script_part2 id idle

#Command be like:
#./dpm_simulator -h coeff1 coeff2 coeff3 threshold1 threshold2 -psm ./example/psm_history.txt -wl ./example/WL.txt


#first try:
#./dpm_simulator -h -6.8285e-07 1.0003 2.13 10 0 -psm ./example/psm_history.txt -wl ./example/wl1.txt

#Coefficients:
#k1(as they are):  -6.8285e-07 	
#k1(all positive) = 8.3075e-07
#k2 = 1.0003
#k3 = 2.13

k1=-0.00000068285
k2=1.0003
k3=2.13

id=$1
idle=$2
row=25
row_run=18
row_idle=19
row_sleep=20
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
    
    s="./dpm_simulator -h $k1 $k2 $k3 $idle $timeout -psm example/psm_history.txt -wl workloads/uncorrelated/wl$id.txt > historyPrediction/uncorrelated/case$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt"
    
    eval $s

    echo
    echo

    echo "Reading from file Tto_idle_$idle.txt for case $id..." 
    echo
    
    #Energy statistics
    s=$(head -$row "historyPrediction/uncorrelated/case$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPrediction/uncorrelated/case$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max].txt"

    #Total time in run state
    s=$(head -$row_run "historyPrediction/uncorrelated/case$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPrediction/uncorrelated/case$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_run.txt"

    #Total time in idle state
    s=$(head -$row_idle "historyPrediction/uncorrelated/case$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPrediction/uncorrelated/case$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_idle.txt"

    #Total time in sleep state
    s=$(head -$row_sleep "historyPrediction/uncorrelated/case$id/Tto_idle_$idle/Tto_idle_[$idle]_Tto_sleep_[$timeout].txt" | tail -1)
    p=$(echo $s | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')
    echo $p $timeout >> "historyPrediction/uncorrelated/case$id/Tto_idle_$idle/energy_saved_case${id}_Tto_idle_[$idle]_Tto_sleep_[0-$max]_time_in_sleep.txt"

    let timeout+=5
done

