#!/bin/sh
      name=$(zenity --file-selection --filename="/home/yash/ProjectUSP/") 


	count=$( grep -c "$name" hello.txt )
	#echo $count
       if [ $count -eq 1 ]
	then
	   pass=$(zenity --password)
	   valid=$( grep -c "$name--$pass" hello.txt)
	   #echo $line
	    echo $valid
	   if [ $valid -eq 1 ]
	   then
	     line=$( grep -n "$name--$pass" hello.txt  | grep -Eo '^[^:]+') 
	     #decryption of the file
	      
	     sh decrypt.sh
	     #echo "Your file has been decrypted"
	     sed -i "${line}d" hello.txt
	   else
	     zenity --error --text="Invalid password" --height=200 --width=500
	     pass1=$(zenity --password --text="Re-enter password")
	     valid1=$( grep -c "$name--$pass1" hello.txt)
	     #echo $line
	     echo $valid1
	     if [ $valid1 -eq 1 ]
	     then
	       line1=$( grep -n "$name--$pass1" hello.txt  | grep -Eo '^[^:]+') 
	     #decryption of the file
	      
	     sh decrypt.sh
	     #echo "Your file has been decrypted"
	     sed -i "${line1}d" hello.txt
	     else
	       zenity --error --text="Invalid password" --height=200 --width=500
	     
             fi
           fi
	else
	  zenity --error --text="The file has not been encrypted to decrypt" --height=200 --width=500
	fi

    
