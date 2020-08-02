#!/bin/bash

#Initialising Player in Array
player=( 'player01' )

for (( i=0; i < ${#player[@]}; i++ ))
do
   playerPosition[${player[i]}]=0
#Rolling dice to move the player in game
   diceRoll=$(( RANDOM % 6 + 1 ))
   playerPosition[${player[i]}]=$(( ${playerPostion[${player[i]}]} + $diceRoll ))
done
