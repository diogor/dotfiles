#!/bin/sh

setxkbmap br
slstatus &
nitrogen --restore &
lxsession &
picom -bc &
dunst & 
volumeicon &
blueman-applet &
nm-applet &
