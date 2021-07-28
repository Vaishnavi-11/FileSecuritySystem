#!/bin/sh

name=$(zenity --file-selection --filename="/home/yash/ProjectUSP/") 
echo "The filename is $name"

pass=$(zenity --password)
echo "The password is $pass"


