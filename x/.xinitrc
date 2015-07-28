#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Source .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xset r rate 200 30
srandrd ~/.scripts/detect_displays.sh

# unclutter -idle 5 &

# parcellite -n &

# xautolock -time 60 -locker "sudo pm-suspend" &

# Start Conky
# xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &
# conky -d; sleep 1 && transset-df .5 -n Conky

# Run awesome
# exec awesome

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
