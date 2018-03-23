#!/bin/bash

OUTPUT_IMAGE=/tmp/lock-screen.png
LOCK_ICON=$HOME/.config/i3lock/lock.png


scrot $OUTPUT_IMAGE
convert $OUTPUT_IMAGE -scale 2.5% -scale 4000% $OUTPUT_IMAGE

if [[ -f $LOCK_ICON ]]
then
  convert $OUTPUT_IMAGE $LOCK_ICON -gravity center -composite $OUTPUT_IMAGE
fi

i3lock --ignore-empty-password --no-unlock-indicator --nofork --image $OUTPUT_IMAGE
