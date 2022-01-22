#!/bin/bash

(setxkbmap -query | grep -q "layout:\s\+us") && setxkbmap lt || setxkbmap us
