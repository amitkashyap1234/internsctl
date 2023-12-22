#!/bin/bash

file="$2"

# Check if the file exists
if [ ! -e "$file" ]; then
    echo "File $file does not exist."
    exit 1
fi

if [ "$1" == "--size" ] || [ "$1" == "-s" ]; then
    stat -c "%s" "$file"
elif [ "$1" == "--permissions" ] || [ "$1" == "-p" ]; then
    ls -l "$file" | awk '{print $1}'
elif [ "$1" == "--owner" ] || [ "$1" == "-o" ]; then
    stat -c "%U" "$file"
elif [ "$1" == "--last-modified" ] || [ "$1" == "-m" ]; then
    stat -c "%y" "$file"
else
    echo "Invalid option. Use '--help' for file options."
fi
