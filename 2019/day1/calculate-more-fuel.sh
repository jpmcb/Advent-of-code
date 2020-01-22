#!/bin/bash

if [ $# -eq 0 ]
then
  echo "Please provide file input ex: calculate-more-fuel.sh input.txt"
  exit
fi

function calculate {
    echo "In calculate ... $1"
    if [ $1 -gt 0 ]
    then
        plusFuel=$(( ($1 / 3) - 2 ))
        echo "plusFuel: $plusFuel"
        evenMore=$( calculate $plusFuel )
        return $(( plusFuel + evenMore ))
    else 
        # echo "Zero fuel! Wishing very hard"
        return 0
    fi
}

total=0
current=0

while read p; do
  currentFuel=$(( (p / 3) - 2 ))
  evenMore=$( calculate $currentFuel )
  total=$((total + currentFuel + evenMore))
done < "$1"

echo "Total fuel: $total"
