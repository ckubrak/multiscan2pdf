#!/bin/bash 
echo "Insert desired file name: "
read NAME
echo "Enter to start scanning: "
read INPUT
COUNT=0
END=.tiff
PDF=.pdf
PATTH=/tmp/scans/
ASTK="*"

#Everytime the input is empty, scan again
while [ -z "$INPUT" ]; do
	scanimage --format tiff > $PATTH$COUNT$END #Scan the image
	let COUNT=COUNT+1 #Raise the count
	read INPUT #Ask for input again
done

#When the input is not empty anymore


tiffcp /tmp/scans/*.tiff $PATTH$NAME$END #Put all the .tiff together in one
tiff2pdf -z -o $NAME$PDF $PATTH$NAME$END #Convert the big .tiff to pdf

#Once it's done, delete all the .tiff files
#for i in $PATTH; do
#	rm $i 
#done 




#PORONGAS
