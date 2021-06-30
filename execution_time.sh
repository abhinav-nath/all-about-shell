#!/bin/bash

#start time measurement
START=$(date +%s)
sleep 2  #sleep 2 seconds
END=$(date +%s)

#end time measurement
DIFFERENCE=$(( END - START ))

echo "time elapsed : $DIFFERENCE seconds"
