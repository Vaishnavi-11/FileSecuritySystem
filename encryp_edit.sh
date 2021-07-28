#!/bin/sh

name=$(zenity --file-selection --filename="/home/yash/ProjectUSP/") 
#echo "The filename is $name"



#echo "The password is $pass"

count=$( grep -c "$name" hello.txt )
	
	if [ $count -eq 1 ]
	then
	  zenity --error --text="This file has already been encrypted" --height=200 --width=500
	else
	  pass=$(zenity --password)
	  echo "$name--$pass" >> hello.txt
	  zenity --info --text="File encrypted successfully" --height=200 --width=500
	fi

