#!/bin/bash

x=1

while [[ $x -le 10 ]]
do
  read -p "Counter $x: Press enter to increment"
  (( x ++ ))
done

echo "Counting complete!"
