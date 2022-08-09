#!/bin/bash

# to copy an array
# arrayClone=("${oldArray[@]}")

# or to add elements to a preexistent array
# someArray+=("${oldArray[@]}")

arr1=(one two three four)

arr2=("${arr1[@]}")

unset 'arr2[1]'

echo "arr1 : ${arr1[@]}"
echo "arr2 : ${arr2[@]}"
