#!/bin/bash

# MATH CALCULATION can be done using
#
# let
# (( ))
# [ ]
# expr
# bc   ->   only bc operates on floating point


# using let
NUMBER=7
let RESULT=NUMBER+5     #don't use $ sign i.e $NUMBER when using let
echo "using let, RESULT=$RESULT"

let NUMBER++
let NUMBER+=5

let NUMBER--
let NUMBER-=5

echo "NUMBER=$NUMBER"


# using (( ))
RESULT=$(( NUMBER + 5 ))

# using [ ]
RESULT=$[ NUMBER + 5 ]

# using expr
RESULT=$(expr $NUMBER + 5)
RESULT=`expr $NUMBER + 5`
RESULT=`expr 2 + 3`

# using bc
RESULT=`echo "$NUMBER * 1.9" | bc`
echo "RESULT from bc=$RESULT"
