#!/bin/sh

# xrdb -load ~/.config/X11/xresources
xset s 300 300
xss-lock --slock &

dunst &
ibus-daemon -drx &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
nitrogen --restore &
copyq &
flameshot &

exec dwm
