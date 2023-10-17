#!/bin/bash
compareDate=$(date -v-"30d" '+%Y%m%d')
logfile="/Users/jchad/projects/mac-scripts/log/clean_downloads_log.txt"
echo "$(date '+%Y-%m-%d %H:%M:%S')" > "$logfile"
for f in /Users/jchad/Downloads/*;
do
    fileDate=$(date -r "$f" -u "+%Y%m%d")
    if [ ! "$fileDate" -gt "$compareDate" ];then
        echo Deleting - "$f" >> "$logfile"
        mv "$f" /Users/jchad/.Trash
    else
        echo Keeping - "$f" >> "$logfile"
    fi
done