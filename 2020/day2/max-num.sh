#!/usr/bin/env bash

awk '{ print $1 }' input.txt | sed  "s|.*-||g"