#!/bin/bash

# meaningful Tto_idle values to be tested for different cases
Tto_idle_case1=(0 20 40 60 80 100)
Tto_idle_case2=(0 50 150 200 250 300)
Tto_idle_case3=(0 60 100 140)
Tto_idle_case4=(0 50 100 150 200 300)
Tto_idle_case5=(0 25 50 75 100 125 150 175)

#case 1
for t in ${Tto_idle_case1[@]}; do
  eval "./scriptHistoryPredictionUncorrelatedFitV1.sh 1 $t"
done

#case 2
for t in ${Tto_idle_case2[@]}; do
  eval "./scriptHistoryPredictionUncorrelatedFitV1.sh 2 $t"
done

#case 3
for t in ${Tto_idle_case3[@]}; do
  eval "./scriptHistoryPredictionUncorrelatedFitV1.sh 3 $t"
done

#case 4
for t in ${Tto_idle_case4[@]}; do
  eval "./scriptHistoryPredictionUncorrelatedFitV1.sh 4 $t"
done

#case 5
for t in ${Tto_idle_case5[@]}; do
  eval "./scriptHistoryPredictionUncorrelatedFitV1.sh 5 $t"
done
