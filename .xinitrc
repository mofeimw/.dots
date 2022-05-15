# enable fn key
if [ -f /tmp/.evrouter:1 ]; then rm /tmp/.evrouter:1; fi
evrouter /dev/input/event8

# start xmodmap
(sleep 6 && xmodmap $HOME/.Xmodmap) &

# load wm
exec /usr/bin/ratpoison
