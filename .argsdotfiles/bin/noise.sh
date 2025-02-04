#!/usr/bin/env bash

# depends on mpv and ffmpeg

mpv "av://lavfi:anoisesrc=color=brown,volume=0.5"
