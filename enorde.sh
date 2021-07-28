#!/bin/sh

opt=$(zenity --list --title="Encryption or Decryption" --radiolist --column "Choice" --column "Operation" 1 Encryption 2 Decryption --width=500 --height=200)

if [ $opt = 'Encryption' ]
then 
  zenity --notification --text "You chose Encryption"
  sh encryp.sh
fi

if [ $opt = 'Decryption' ]
then 
  zenity --notification --text "You chose Decryption"
  sh decryp.sh
fi


