#!/usr/bin/env bash

icon="$HOME/.config/i3lock/lock.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 2.5% -scale 4000% "$tmpbg"
#convert "$tmpbg" -blur 0x10 "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"

# dim screen
xbacklight -set 10

i3lock -f -i "$tmpbg"
