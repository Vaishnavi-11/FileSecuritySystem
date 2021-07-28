#!/bin/bash
echo "Enter the absolute path of the file:"
read path
if [ -f "$path" ]
then
	echo "Enter the password"
	read password
	echo "$path_$password" >> t1.txt
	#t1.txt is a text file which holds the pathname of the file to be encrypted and the user password 		separated by a semicolon.
else
	echo "$path does not exists"

fi
