#!/bin/bash

array1=(one two three)
array2=(1 2 3)

echo ${array1[@]}

echo ${array2[@]}

declare -A associative_array=( [one]=1 [two]=2 [three]=3 )

echo "${associative_array[one]}"
echo "${associative_array[two]}"
