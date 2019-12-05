#!/bin/bash

if [[ $# -eq 0 ]]
then
  echo "Please provide file input ex: compute-fuel input.txt"
  exit
fi

totalFuel=0

while read p; do
    currentFuel=${p}

    while [[ ${currentFuel} -gt 0 ]]; do
        currentFuel=$(( (currentFuel / 3) - 2 ))

        if [[ current -gt 0 ]]
        then
            totalFuel=$((totalFuel + currentFuel))
        fi
    done

done < "$1"

echo "Total fuel: $totalFuel"

