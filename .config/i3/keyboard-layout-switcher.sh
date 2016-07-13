#!/bin/bash

(setxkbmap -query | grep -q "layout:\s\+us") && setxkbmap lt || setxkbmap us

# map caps lock to escape
setxkbmap -option caps:escape &

# map atlgr to ctrl
setxkbmap -option ctrl:ralt_rctrl

# set key repeat rates
xset r rate 200 20

