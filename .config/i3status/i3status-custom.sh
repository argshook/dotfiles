#!/bin/sh
# shell script to prepend i3status with cmus song and artist
i3status | while :
do
  read line
  # artist=$(cmus-remote -Q | grep ' artist ' | cut -d ' ' -f3-)
  # song=$(cmus-remote -Q | grep title | cut -d ' ' -f3-)
  stream=$(cmus-remote -Q | grep stream | cut -d ' ' -f2-)
  echo " $stream | $line" || exit 1
done

