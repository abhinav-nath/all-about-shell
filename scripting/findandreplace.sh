#!/bin/bash

# Usage: ./findandreplace.sh input.txt

if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILE="$1"

# Replace words (case-sensitive)
sed -i '' \
    -e 's/apple/mango/g' \
    -e 's/peach/rose/g' \
    -e 's/orange/plum/g' \
    "$FILE"
