#!/bin/bash
ICON=$HOME/.xlock/icon.png
TMPBG=$HOME/.config/i3/wallpaper.png
#convert $TMPBG -blur 0x3 $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
i3lock -i $TMPBG
