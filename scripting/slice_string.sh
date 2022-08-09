#!/bin/bash

str="Bash Scripting is cool and all programmers must learn it"

sub_str=${str:0:23}

echo "using parameter expansion : $sub_str"

sub_str=$(echo $str | cut -d ' ' -f 1-4)

echo "using cut                 : $sub_str"
