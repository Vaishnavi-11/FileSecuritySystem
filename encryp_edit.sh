#!/bin/sh

name=$(zenity --file-selection --filename="/home/vaishnavi/BMSCE/USP/Linux_Project/")
#echo "The filename is $name"


count=$( grep -c "$name" shared_file.txt )

if [ $count -eq 1 ]
then
zenity --error --text="This file has already been encrypted" --height=200 --width=500
else
pass=$(zenity --password --title="Enter password")
echo "$name-$pass" >> shared_file.txt
zenity --info --text="File encrypted successfully" --height=200 --width=500
./encrypt.sh $name
fi


