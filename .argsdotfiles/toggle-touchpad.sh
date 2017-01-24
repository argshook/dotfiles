#!/bin/bash

TOUCHPAD_OFF_STATUS=`synclient | awk '/TouchpadOff/ { print $3 }'`

if [ $TOUCHPAD_OFF_STATUS -eq '0' ]; then
  synclient TouchpadOff=1
else
  synclient TouchpadOff=0
fi

