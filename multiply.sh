#!/bin/bash

if [ ! $# -eq 2 ]; then
	echo "run the script with exactly 2 arguments"
	exit 1
fi

let RESULT=$1*$2

# $? gives the exit status of the last executed command

if [ $? -ne 0 ]; then
	echo "only numeric arguments are allowed"
	exit 2
fi

echo "$1 x $2 = $RESULT"
