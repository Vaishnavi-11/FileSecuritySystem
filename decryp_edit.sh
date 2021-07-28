#!/bin/sh
      name=$(zenity --file-selection --filename="/home/vaishnavi/BMSCE/USP/Linux_Project/") 


	count=$( grep -c "$name" shared_file.txt )
	#echo $count
       if [ $count -eq 1 ]
	then
	   pass=$(zenity --password --title="Enter password")
	   valid=$( grep -c "$name-$pass" shared_file.txt)
	   #echo $line
	    echo $valid
	   if [ $valid -eq 1 ]
	   then
	     line=$( grep -n "$name-$pass" shared_file.txt  | grep -Eo '^[^:]+') 
	     #decryption of the file
	      
	     ./decrypt.sh $name
	     zenity --info --text="File decrypted successfully" --height=200 --width=500
	     #echo "Your file has been decrypted"
	     sed -i "${line}d" shared_file.txt
	   else
	     zenity --error --text="Invalid password" --height=200 --width=500
	     pass1=$(zenity --password --title="Re-enter password")
	     valid1=$( grep -c "$name-$pass1" shared_file.txt)
	     #echo $line
	     echo $valid1
	     if [ $valid1 -eq 1 ]
	     then
	       line1=$( grep -n "$name-$pass1" shared_file.txt  | grep -Eo '^[^:]+') 
	     #decryption of the file
	      
	     ./decrypt.sh $name
	     zenity --info --text="File decrypted successfully" --height=200 --width=500
	     #echo "Your file has been decrypted"
	     sed -i "${line1}d" shared_file.txt
	     else
	       zenity --error --text="Invalid password" --height=200 --width=500
	     
             fi
           fi
	else
	  zenity --error --text="The file has not been encrypted to decrypt" --height=200 --width=500
	fi

    
