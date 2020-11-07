#!/bin/sh

if [ $# -ne 3 ]
  then
    echo "Wrong parameter count"
    exit
fi

time=$(($2-$1))

# commands must at least run 15 minutes
if [ $time -lt 900 ]
  then
    exit
fi

time=$((time/60))

notify-send "pueue" "$3  - $time minutes"
