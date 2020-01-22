#!/bin/bash

if [[ $# -eq 0 ]]
then
  echo "Please provide file input ex: calculate-fuel.sh input.txt"
  exit
fi

totalFuel=0
currentFuel=0

while read p; do
  currentFuel=$(( (p / 3) - 2 ))
  totalFuel=$((totalFuel + currentFuel))
done < "$1"

echo "Total fuel: $totalFuel"
