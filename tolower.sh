#!/bin/bash

if [ $# -ne 1 ]; then 
	echo "provide one string as input"
	exit 1
fi

echo "$1" | tr '[:upper:]' '[:lower:]'
