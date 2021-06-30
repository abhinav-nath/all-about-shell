#!/bin/bash

array=(one two three)

echo ${#array[@]}

unset 'array[1]'
array=(${array[@]})

echo ${array[@]}

echo ${#array[@]}
