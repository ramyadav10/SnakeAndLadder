#!/bin/bash

#Initialising Player in Array
player=( 'player01' 'player02' )

for (( i=0; i < ${#player[@]}; i++ ))
do
   playerPosition[${player[i]}]=0

#Rolling dice to move the player in game
   diceRoll=$(( RANDOM % 6 + 1 ))
   typeOfMove=$(( RANDOM % 3 ))

#To check the Player move for No-Play, Snake & Ladder
   case $typeOfMove  in
      0) echo "Stay...!";;
      1) echo "Snake is Here, move $diceRoll steps Behind"
         playerPosition[${player[i]}]=$(( ${playerPostion[${player[i]}]} - $diceRoll )) ;;
      2) echo "Ladder is Here, move $diceRoll steps Forward"
         playerPosition[${player[i]}]=$(( ${playerPostion[${player[i]}]} + $diceRoll )) ;;
   esac

echo "${player[i]} is at position ${playerPosition[@]}"
done

