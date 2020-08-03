#!/bin/bash

#Initialising Player in Array
player=('P1' 'P2')
WINPOINT=100
flag=0
totalDiceRoll=0

declare -A playerPosition

#Setting-up each player position to 0
for (( i=0; i < ${#player[@]}; i++ ))
do
   playerPosition[${player[i]}]=0
done

while [ $flag -lt 1 ]
do

   for (( j=0; j < ${#player[@]}; j++ ))
   do
      totalDiceRoll=$(( $totalDiceRoll +  1 ))
      currentPlayer=${playerPosition[${player[$j]}]}
      diceRoll=$(( RANDOM % 6 + 1 ))
      typeOfMove=$(( RANDOM % 2 ))

      if [ $typeOfMove == 0 ] #For Snake place
      then
         playerPosition[${player[$j]}]=$(( $currentPlayer - $diceRoll ))

#If player position is less than 0, then it should be at 0
         if [ ${playerPosition[${player[$j]}]} -lt 0 ]
         then
            playerPosition[${player[$j]}]=0
         fi

      elif [ $typeOfMove == 1 ] #For Ladder
      then
         playerPosition[${player[$j]}]=$(( $currentPlayer + $diceRoll ))
         diceTwice=$(( RANDOM % 6 +1 ))
         playerPosition[${player[$j]}]=$(( ${playerPosition[${player[$j]}]} + $diceTwice ))
         totalDiceRoll=$(( $totalDiceRoll +  1 ))
      fi

#Ensuring player winning position should not be greater than WINPOINT
   if [ ${playerPosition[${player[$j]}]} -gt $WINPOINT ]
   then
      playerPosition[${player[$j]}]=$(( ${playerPosition[${player[$j]}]} - $diceTwice ))
   fi

#Ensuring player winning position should be equal to WINPOINT
   if [ ${playerPosition[${player[$j]}]} -eq $WINPOINT ]
   then
      echo "Player ${player[$j]} Won The Game"
      flag=1
   fi

   done

done
echo "${player[0]} is at position: ${playerPosition[${player[0]}]}"
echo "${player[1]} is at position: ${playerPosition[${player[1]}]}"


