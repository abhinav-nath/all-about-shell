#!/bin/bash

# backup all .pdf files from prod location to a backup destination
# script takes one argument:
# destination path - which needs to end with /backup e.g. /home/tom/bash/wildcards/backup

PROD=/c/Users/abhnath/git/gitlab/shell-scripts/hands-on/wildcards/prod

# argument check
if [ $# -ne 1 ]; then
	echo "only one argument is needed, run $0 destination-path"
	exit 1
fi

# destination path check
DESTINATION=$1
if [[ $DESTINATION != */backup ]]; then
	echo "wrong destination path, destination path must end with /backup"
	exit 2
fi

# create destination dir
DATE=$(date +%Y-%m-%d_%H_%M_%S)
mkdir -p $DESTINATION/$DATE

# copy from prod to destination dir
cp $PROD/*.pdf $DESTINATION/$DATE

# test exit status of copy command
if [ $? -eq 0 ]; then
	echo "backup OK"
else
	echo "backup failed"
fi
