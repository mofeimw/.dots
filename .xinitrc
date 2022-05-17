# load .Xresources
xrdb -merge $HOME/.Xresources

# ratpoison wm
exec /usr/bin/ratpoison
