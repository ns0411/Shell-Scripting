#!/bin/bash
DIR=""
BACKUP_DIR=$DIR"/backup"

if [ -d "$BACKUP_DIR" ] ; then
    :
else
    mkdir -p "$BACKUP_DIR"
fi

#Fetches the files which are more than 90 days old, will be moved to the backup folder
OLD_FILES=$(find "$DIR" -maxdepth 1 -mtime +90)
echo $OLD_FILES
mv $OLD_FILES $BACKUP_DIR

#Removes the backup files which are more than 180 days old
PURGE_FILES=$(find "$BACKUP_DIR" -mtime +180)
rm -f $PURGE_FILES
