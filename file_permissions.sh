#!/bin/bash

# print the summary of file permissions
# Example:
# ./file_permissions.sh hello.txt
# READ:    YES
# WRITE:   NO
# EXECUTE: NO

# argument check
if [ $# -ne 1 ]; then
	echo "provide exactly one argument"
	exit 1
fi

# variable assignment
FILE=$1

# check if the file exists
if [ -f $FILE ]; then

	# default variables
	VAR_READ="NO"
	VAR_WRITE="NO"
	VAR_EXECUTE="NO"

	# check if the file is readable
	if [ -r $FILE ]; then
		VAR_READ="YES"
	fi

	# check if the file is writable
	if [ -w $FILE ]; then
		VAR_WRITE="YES"
	fi

	# check if the file is executable
	if [ -x $FILE ]; then
		VAR_EXECUTE="YES"
	fi

	# print permissions summary
	echo "=== FILE: $FILE ==="
	echo "READ:       $VAR_READ"
	echo "WRITE:      $VAR_WRITE"
	echo "EXECUTE:    $VAR_EXECUTE"

else
	if [ -d $FILE ]; then
		echo "$FILE is a directory"
	else
		echo "$FILE does not exist"
	fi
fi
