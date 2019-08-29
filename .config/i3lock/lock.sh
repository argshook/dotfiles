#!/bin/bash

OUTPUT_IMAGE=/tmp/lock-screen.png
# LOCK_ICON=$HOME/.config/i3lock/lock.png
# LOCK_ICON=$HOME/.config/i3lock/lock2.jpg

if [[ -f $OUTPUT_IMAGE ]]
then
  rm $OUTPUT_IMAGE
fi

scrot $OUTPUT_IMAGE
convert $OUTPUT_IMAGE -scale 2.5% -scale 4000% $OUTPUT_IMAGE

if [[ -f $LOCK_ICON ]]
then
  convert $OUTPUT_IMAGE \
    $LOCK_ICON -gravity center -composite \
    -fill white -annotate +0+400 "$(fortune)" \
    $OUTPUT_IMAGE
fi

i3lock --ignore-empty-password --no-unlock-indicator --nofork --image $OUTPUT_IMAGE
