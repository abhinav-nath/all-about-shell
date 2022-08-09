#!/bin/bash

array=( Apple Mango Strawberry )

echo "before append : ${array[@]}"

element_to_append="Banana"
array+=(${element_to_append})

echo "after append : ${array[@]}"
