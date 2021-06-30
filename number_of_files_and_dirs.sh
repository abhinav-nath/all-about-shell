#!/bin/bash

if [ -d "$@" ]; then
	echo "Files found: $(find "$@" -type f | wc -l)"
	echo "Directories found: $(find "$@" -type d | wc -l)"
else
	echo "[ERROR] Please retry with another directory"
	exit 1
fi
