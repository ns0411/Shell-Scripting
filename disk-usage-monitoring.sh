#!/bin/bash
outPut=$(df -h | awk '{sub(/%/, "", $5);if($5>85) print $0}')

lines=$(echo "$outPut"| wc -l)
if [ $lines >1 ];
then echo "${outPut}"| sendmail -s "WARNING: File System Alert on Host $(hostname -i)" <Mail_ID>
fi
