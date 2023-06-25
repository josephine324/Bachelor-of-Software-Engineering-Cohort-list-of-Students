#!/usr/bin/env bash

remote_host="a0dfc11ba139.a982e858.alu-cod.online"
remote_username="a0dfc11ba139"
remote_password="899c79fc532cd0591af1"
remote_directory="/home/sftp-student/03033/summative"
local_directory="negpod_id-q1"

backup_filename="backup-${local_directory}.sh"

# Create the backup shell script
echo "#!/bin/bash" > "$backup_filename"
echo "" >> "$backup_filename"
echo "scp -r $local_directory $remote_username@$remote_host:$remote_directory" >> "$backup_filename"

# Set execute permission for the backup shell script
chmod +x "$backup_filename"

echo "Backup script $backup_filename created."

# Transfer the backup shell script to the remote server
scp "$backup_filename" "$remote_username@$remote_host:$remote_directory"

echo "Backup script $backup_filename transferred to the remote server."

