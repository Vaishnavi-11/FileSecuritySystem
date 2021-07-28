#!/bin/sh

echo "Enter pathname"
read pathname

if [ -f "$pathname" ]
then
	count=$( grep -c "$pathname" t1.txt )
	if [ $count == 1 ]
	then
		echo "Enter Password"
		read password
		valid=$( grep -c "$pathname_$password" t1.txt)
		if [ $valid == 1 ]
		then
			#decryption of the file
			echo "Your file has been decrypted"
		else
			echo "Invalid password"
		fi
	else
		echo "Incorrect Pathname of the file"
	fi
else
	echo "The file does not exist"
fi
