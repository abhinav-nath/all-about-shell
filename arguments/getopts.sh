#!/bin/bash

while getopts :a:bc opt ; do
    case "$opt" in
        a)	echo "option -$opt with argument <${OPTARG}>"  ;;
	b)	echo "option -$opt does not require any argument" ;;
	c)	echo "option -$opt does not require any argument" ;;
	:)	echo "missing argument" ;;
	?)	echo "bad option" ;;
    esac
done
