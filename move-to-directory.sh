#!/usr/bin/env bash

directory_name="negpod_id-q1"

# Create the directory if it doesn't exist
if [ ! -d "$directory_name" ]; then
    mkdir "$directory_name"
fi

# Move all the files created in question 1 to the directory
mv main.sh students-list_0333.txt select-emails.sh student-emails.txt "$directory_name/"

echo "Files moved to $directory_name directory."

