#!/bin/bash

# ./files.sh [-l location] [--location location] [-e extension] [--extension extension] [-s stats] [--stats stats] [-h help] [--help help]

function usage() {
	echo -e "\nUSAGE:\n$0 [-l location] [--location location] [-e extension] [--extension extension] [-s stats] [--stats stats] [-h help] [--help help]"
	echo -e "\nExamples:"
	echo "$0 -l /etc/ -e txt -s"
	echo "$0 -e pdf --stats"
	echo
	exit 1
}

LOCATION_SET=0   # 0-location not set, use current location     1-location set
STATS=0          # 0-do not display statistics                  1-display statistics

while [ $# -gt 0 ]
do
	case $1 in
		-l|--location )
			LOCATION="$2"
			if ! [ -d "$LOCATION" ]; then
				usage
			fi
			LOCATION_SET=1
			shift
			shift
			;;

		-e|--extension )
			EXT="$2"
			shift
			shift
			;;

		-s|--stats )
			STATS=1
			shift
			;;

		-h|--help )
			shift
			usage
			;;

		* )
			usage
			;;
	esac
done

if [ $LOCATION_SET -ne 1 ]; then
	LOCATION=$(pwd)
fi

echo "Location: $LOCATION"

if [ "$EXT" != "" ]; then
	ls -l $LOCATION | awk '/^-/' | grep "\.$EXT" &>/dev/null
	if [ $? -ne 0 ]; then
		echo "No file with extension $EXT found"
		exit 2
	fi
	
	# count size of files with specific extension
	ls -l $LOCATION | awk '/^-/' | grep "\.$EXT" | awk -v stats=$STATS -f /c/Users/abhnath/git/gitlab/shell-scripts/shell-scripting-hands-on/awk/size.awk
else
	ls -l $LOCATION | awk '/^-/' | awk -v stats=$STATS -f /c/Users/abhnath/git/gitlab/shell-scripts/shell-scripting-hands-on/awk/size.awk

fi
