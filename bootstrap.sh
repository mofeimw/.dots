#!/bin/sh

main() {
    trap "stty icanon; exit" EXIT INT

    [ ! -d "$HOME/.circus" ] && git clone https://github.com/mofeimw/bin "$HOME/.circus"

    [ ! -d "$HOME/.zsh" ] && mkdir "$HOME/.zsh"
    [ ! -d "$HOME/.zsh/typewritten" ] && git clone https://github.com/reobin/typewritten.git "$HOME/.zsh/typewritten"

    [ ! -d "$HOME/.vim" ] && mkdir "$HOME/.vim"
    [ ! -d "$HOME/.vim/colors" ] && mkdir "$HOME/.vim/colors"

    [ ! -d "$HOME/wallpaper" ] && cp -r ./wallpaper "$HOME"

    install .zshrc
    install .vimrc
    install .vim/colors/nyx.vim
    install .config/kitty/kitty.conf
    install .yabairc
    install .skhdrc
    install nyx.theme

    echo "\ninstall complete."
}

install() {
    if cmp --silent -- "$1" "$HOME/$1"; then return; fi

    [ -f "$HOME/$1" ] && overwrite "$1"
    [ "$overwrite" = n ] && return

    cp "$1" "$HOME/$1"
}

overwrite() {
    printf "overwrite ${1}? y/n: "

    stty -icanon
    overwrite=$(dd ibs=1 count=1 2>/dev/null)
    stty icanon

    printf "\n"
}

main "$@"
