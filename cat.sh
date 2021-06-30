#!/bin/bash

# script for printing file contents along with line numbers

# argument check
if [ $# -ne 1 ]; then
	echo "exactly one argument is needed, run $0 file-path"
	exit 1
fi

# check if argument is a file
if ! [ -f "$1" ]; then
	echo "the file you have specified does not exist"
	exit 2
fi

FILENAME=$1
COUNT=1

cat "$FILENAME" |
	while read line
	do
		echo "$COUNT: $line"
		let COUNT++
	done
