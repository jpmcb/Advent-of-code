#!/bin/bash

if [ $# -eq 0 ]
then
  echo "Please provide file input ex: compute-fuel input.txt"
  exit
fi

total=0
current=0

while read p; do
  current=$(( (p / 3) - 2 ))
  total=$((total + current))
done < "$1"

echo "Total fuel: $total"

