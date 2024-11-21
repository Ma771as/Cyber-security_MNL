#!/usr/bin/bash

# Simple Password Generator for alphanumeric combination of n lenght 
echo "Welcome to your trusted password generator"
echo "Please enter the required lenght: "
read PASS_LENGHT


for p in $(seq 1);
do
	openssl rand -base64 48 | cut -c1-$PASS_LENGHT
done
