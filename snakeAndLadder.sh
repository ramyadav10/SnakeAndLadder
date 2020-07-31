#!/bin/bash

#Initialising Player in Array
player=( 'player01' 'player02' )

for (( i=0; i < ${#player[@]}; i++ ))
do
   playerPosition[${player[i]}]=0

   echo "${player[i]} is at position ${playerPosition[@]}"
done

