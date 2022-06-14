#!/bin/sh


#exec dwmblocks &

#exec dwm

xrdb -merge ~/.XResources &
feh --bg-fill `ls -d ~/wallpapers/* | shuf -n 1` &
exec i3


