#!/usr/bin/fish

xset s 300 300
xss-lock --slock &

/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

nitrogen --restore &
copyq &

exec dwm
