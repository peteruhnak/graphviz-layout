#!/bin/bash

echo "[$1] starting" >> /tmp/log.txt
echo "[$1] about to execute" >> /tmp/log.txt
dot "$1.dot" -Tsvg > "$1.svg" 2> "$1.log"
echo "[$1] processed" >> /tmp/log.txt
echo $? > "$1.complete"
echo "[$1] done" >> /tmp/log.txt
echo "================================================================================" >> /tmp/log.txt
