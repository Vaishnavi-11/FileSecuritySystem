#!/bin/sh

echo "Enter pathname"
read pathname

if [ -f "$pathname" ]
then
	count=$( grep -c "$pathname" t1.txt )
	echo $count
	if [ $count -eq 1 ]
	then
		echo "Enter Password"
		read password
		valid=$( grep -c "$pathname-$password" t1.txt)
		line=$( grep -n "$pathname-$password" t1.txt  | grep -Eo '^[^:]+') 
		echo $line
		if [ $valid -eq 1 ]
		then
			#decryption of the file
			echo "Your file has been decrypted"
			sed -i "${line}d" t1.txt
		else
			echo "Invalid password"
		fi
	else
		echo "Incorrect Pathname of the file"
	fi
else
	echo "The file does not exist"
fi
