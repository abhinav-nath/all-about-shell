#!/bin/bash

say_hello() {

	echo "hello $1"

	var=$(echo "good morning" | awk '{print $1}')
	echo $var
}

say_hello "abhinav"
