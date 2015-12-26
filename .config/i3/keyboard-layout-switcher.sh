#!/bin/bash

(setxkbmap -query | grep -q "layout:\s\+us") && setxkbmap lt || setxkbmap us

xmodmap -e "clear lock"
xmodmap -e "keysym Caps_Lock = Escape"

# set key repeat rates
xset r rate 200 20

