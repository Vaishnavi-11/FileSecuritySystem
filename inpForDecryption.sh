#!/bin/sh

echo "Enter pathname"
read pathname

if [ -f "$pathname" ]
then
	
	if [ grep -wc "$pathname" t1.txt == 1 ]
	then
		echo "Enter Password"
		read password
	else
		echo "Incorrect Pathname of the file"
	fi
else
	echo "The file does not exist"
fi
