#!/usr/bin/env bash

awk '{ print $2 }' input.txt | sed  "s|:||g"