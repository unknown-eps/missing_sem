#!/bin/bash
for i in $(seq 1 5);
do # Marks start of block
echo "$i";
done # Marks end of block
A="Hell"
echo "$A"
echo "$0" # Prints first argument name of program
echo $$ #prints PID of the program
echo $# #prints number of arguments
# Use double quotes to prevent splitting 
for file in *
    do
        if test -f "$file" 
        then
        echo "$file"
    fi
done