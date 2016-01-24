#!/bin/bash

(setxkbmap -query | grep -q "layout:\s\+us") && setxkbmap lt || setxkbmap us

setxkbmap -option caps:escape &

# set key repeat rates
xset r rate 200 20

