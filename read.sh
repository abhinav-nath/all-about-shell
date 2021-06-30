#!/bin/bash

read -p "Enter username : " user_name   # equivalent to echo "message" and then read
read -sp "Enter password : " password   # -s to hide text while typing

echo "input username - $user_name and password - $password"
