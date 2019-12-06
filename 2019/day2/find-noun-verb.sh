#!/usr/bin/env bash

if [[ $# -eq 0 ]]
then
  echo "Please provide a target value ex: ./find-noun-verb.sh 1999"
  exit
fi

echo "Building int-comp ..."
go build -o int-comp main.go

target=$1
current=0

echo "Finding target ..."
for i in $(seq 1 99) ; do
    for j in $(seq 1 99); do
        current=$(./int-comp input ${i} ${j})

        if [[ ${current} -eq ${target} ]]
        then
            echo "noun: $i"
            echo "verb: $j"
            exit 0
        fi
    done
done

echo "Error: no result found ..."
exit 1
