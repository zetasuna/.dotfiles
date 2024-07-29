#!/usr/bin/sh

/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
nitrogen --restore &
copyq &
exec dwm
