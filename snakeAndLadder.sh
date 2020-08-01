#!/bin/bash

#Initialising Player in Array
WINPOINT=100
player=( 'player01' )
playerPosition[${player[i]}]=0

while [ ${playerPosition[$player[i]]} -lt $WINPOINT ]
do
#Rolling dice to move the player in game
   diceRoll=$(( RANDOM % 6 + 1 ))
   typeOfMove=$(( RANDOM % 2 ))

#To check the Player move for No-Play, Snake & Ladder
if [ $typeOfMove == 0 ] #For Snake place
   then
   playerPosition[${player[i]}]=$(( ${playerPosition[${player[i]}]} - $diceRoll ))

#If player position is less than 0, then it should be at 0
         if [ ${playerPosition[$player[i]]} -lt 0 ]
         then
            playerPosition[${player[i]}]=0
         fi

elif [ $typeOfMove == 1 ] #For Ladder
   then
   playerPosition[${player[i]}]=$(( ${playerPosition[${player[i]}]} + $diceRoll ))
fi

#Ensuring player winning position should be equal to WINPOINT
if [ ${playerPosition[${player[i]}]} -gt $WINPOINT ]
   then
   playerPosition[${player[i]}]=$(( ${playerPosition[${player[i]}]} - $diceRoll ))
fi

done


