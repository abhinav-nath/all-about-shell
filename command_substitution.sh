#!/bin/bash

# two ways to set a command's output to a variable
# 1. by using $()
# 2. by using ``

current_directory=$(pwd)

echo "script is run from : $current_directory"

current_date=`date`

echo "current date : $current_date"
