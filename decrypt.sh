#!/bin/bash

path="$1"
file=""

echo "Enter key"
read key
echo $key

while IFS= read -r -n1 char
do
	ascii=$(printf "%d" "'$char")	
	if [ $ascii -lt $key ]
	then
		sub=`expr $key - $ascii`
	else
		sub=`expr $ascii - $key`
	fi
	convert=$((sub%128))
	ch=$(printf "\x$(printf %x $convert)")
	file+="$ch"
done < "$path"
echo $file > $path
