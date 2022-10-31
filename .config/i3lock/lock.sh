#!/bin/bash

OUTPUT_IMAGE=/tmp/lock-screen.png

if [[ -f $OUTPUT_IMAGE ]]
then
  rm $OUTPUT_IMAGE
fi

maim $OUTPUT_IMAGE
convert $OUTPUT_IMAGE -scale 2.5% -scale 4000% $OUTPUT_IMAGE

if [[ -f $LOCK_ICON ]]
then
  convert $OUTPUT_IMAGE \
    $LOCK_ICON -gravity center -composite \
    -fill white -annotate +0+400 "$(fortune)" \
    $OUTPUT_IMAGE
fi

# invoke i3lock
i3lock --ignore-empty-password --no-unlock-indicator --nofork --image $OUTPUT_IMAGE
