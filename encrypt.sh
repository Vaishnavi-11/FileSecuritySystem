#!/bin/bash

path="$1"
file=""

key=`cat $path | wc -l`
echo "Key of the file $path is $key"
touch temp.txt
while IFS= read -r line
do
	for (( i=0; i<${#line}; i++ ));
	do
		char=${line:$i:1}
		ascii=$(printf "%d" "'$char")
		if [ $ascii -ge 0 ] && [ $ascii -lt 32 ]
		then
			file+=$char
			continue
		else
			sub=`expr $key + $ascii`
			ch=$(printf "\x$(printf %x $sub)")
			file+="$ch"
		fi
	done
	echo $file >> temp.txt
	file=""
done < "$path"
mv temp.txt $path

