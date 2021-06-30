#!/bin/bash

# example - ./arguments.sh one 2 three

# to view the characters of IFS
#   $ set | grep "^IFS"
#   IFS=$' \t\n'

IFS=','
echo "script name : $0"
echo "first argument : $1"
echo "second argument : $2"
echo "all arguments with \$@ : $@"
echo "all arguments with \$* : $*"
echo "argument count : $#"
