#!/bin/bash

#Initialising Player in Array
player=( 'player01' )

for (( i=0; i < ${#player[@]}; i++ ))
do
   playerPosition[${player[i]}]=0
done

