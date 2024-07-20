#!/bin/bash

INPUT_FILE="/opt/input.txt"
OUT_FILE="/opt/output.txt"
ACTIVE_CONNECTION_FILE="/opt/ActiveConnections.txt"
INACTIVE_CONNECTION_FILE="/opt/InactiveConnections.txt"

while read -r DEST
do
        status=$(echo -e '\x1dclose\x0d'| telnet $DEST >> "$OUT_FILE")
        if [ $? == 0 ] ; then
                echo "$DEST" >> "$ACTIVE_CONNECTION_FILE"
        else
                echo "$DEST" >> "$INACTIVE_CONNECTION_FILE"
        fi

done < "$INPUT_FILE"
