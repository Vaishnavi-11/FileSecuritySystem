#!/bin/bash

path="$1"
file=""
touch temp.txt
key=`cat $path | wc -l`
#echo "Enter key"
#read key
#key=$((key+1))
echo $key

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
			if [ $ascii -lt $key ]
			then
				sub=`expr $key - $ascii`
			else
				sub=`expr $ascii - $key`
			fi
			ch=$(printf "\x$(printf %x $sub)")
			file+="$ch"
		fi
	done
	echo $file >> temp.txt
	file=""
done < "$path"
mv temp.txt $path
