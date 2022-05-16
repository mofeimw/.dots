# load .Xresources
xrdb -merge $HOME/.Xresources

# enable fn key
if [ -f /tmp/.evrouter:1 ]; then rm /tmp/.evrouter:1; fi
evrouter /dev/input/event8

# ratpoison wm
exec /usr/bin/ratpoison
