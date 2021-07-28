#!/bin/bash

path="$1"
file=""

key=`cat $path | wc -m`
echo $key

while IFS= read -r -n1 char
do
	echo "character $char"
	ascii=$(printf "%u" "'$char")
	echo "ascii $ascii"
	if [ $ascii -eq 0 ]
	then 
		ch=$(printf "\x$(printf %x 10)")
		file+=$ch
	elif [ $ascii -eq 13 ]
	then
		file+="\r"
	elif  [ $ascii -eq 0 ]
	then
		file+=" "
	else	
		sub=`expr $key + $ascii`
		convert=$((sub%128))
		echo "convert $convert"
		ch=$(printf "\x$(printf %x $convert)")
		echo "convert char $ch"
		file+="$ch"
	fi
done < "$path"
echo $file > $path
