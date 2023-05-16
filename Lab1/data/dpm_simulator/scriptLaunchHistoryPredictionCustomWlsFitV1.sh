#!/bin/bash

# meaningful Tto_idle values to be tested for different cases
Tto_idle=(0 25 50 75 100 125 150 175 200 225 250 275 300 325 350 375 400 425 450 475 500)

#case 1
for t in ${Tto_idle[@]}; do
  eval "./scriptHistoryPredictionCustomWlsFitV1.sh 1 $t"
done

#case 2
for t in ${Tto_idle[@]}; do
  eval "./scriptHistoryPredictionCustomWlsFitV1.sh 2 $t"
done