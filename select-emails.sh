#!/usr/bin/env bash
#Create a command to select just the emails of the student.
filename="students-list_0333.txt"
output="student-emails.txt"

awk -F ', ' '{ print $2 }' $filename > $output
