#!/bin/bash

# script to demonstrate case

# -f or --file will provide info about the file like number of lines, words and characters
# -h or --help will provide usage message

while [ $# -gt 0 ]
do
	case "$1" in
		-h|--help )
			echo "USAGE: $0 [-h] [--help] [-f file] [--file file]"
			shift # remove the -h from the parameter list
			exit 1
			;;
		-f|--file )
			FILE=$2
			if ! [ -f "$FILE" ]; then
				echo "File does not exist !"
				exit 2
			fi

			LINES=`cat "$FILE" | wc -l`
			WORDS=`cat "$FILE" | wc -w`
			CHARACTERS=`cat "$FILE" | wc -m`

			echo "=== FILE: $FILE==="
			echo "Lines:          $LINES"
			echo "Words:          $WORDS"
			echo "Characters:     $CHARACTERS"

			shift # remove the file from the parameter list
			shift # remove -f from the parameter list
			;;
		* ) 
			echo "USAGE: $0 [-h] [--help] [-f file] [--file file]"
                        exit 1
                        ;;
	esac
done
