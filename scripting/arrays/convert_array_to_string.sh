#!/bin/bash

arr=("apple" "mango" "orange" "banana")

echo "printing array - ${arr[@]}"

str=$( IFS=' '; echo "${arr[*]}" )

echo "printing str - [${str}]"
