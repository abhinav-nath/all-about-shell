#!/bin/bash
echo -n "Enter the number : "
read -r num
fact=1
while [ "$num" -ne 0 ]; do
	set -x
	fact=$((fact * num))
	{ set +x; } 2> /dev/null
	num=$((num - 1))
done
echo "factorial = $fact"
