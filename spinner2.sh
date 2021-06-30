#!/bin/bash

spinner=1

for (( i=1; i<=10; i++ ));
do
	echo $i
	arr=('-' '\' '|' '/')
	while [ $spinner -eq 1 ]; do
		for c in "${arr[@]}"; do
			echo -en "\r $c "
			sleep .5
		done
	done	
	sleep 2

done
