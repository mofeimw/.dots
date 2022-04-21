#!/bin/sh

main() {
    trap "stty icanon; exit" EXIT INT

    install .zshrc
    install .vimrc
    install .vim/colors/nyx.vim
    install .config/kitty/kitty.conf
    install .yabairc
    install .skhdrc
    install nyx.theme

    circus
    typewritten

    echo "\ninstall complete."
}

install() {
    if cmp --silent -- "$1" "$HOME/$1"; then return; fi
    if [ -f "$HOME/$1" ]; then overwrite "$1"; fi
    if [ "$overwrite" = n ]; then return; fi
    cp "$1" "$HOME/$1"
}

overwrite() {
    printf "overwrite ${1}? y/n: "

    stty -icanon
    overwrite=`dd ibs=1 count=1 2>/dev/null`
    stty icanon

    printf "\n"
}

circus() {
    if [ ! -d "$HOME/.circus" ]; then cp -R .circus "$HOME"; fi
}

typewritten() {
    if [ ! -d "$HOME/.zsh" ]; then mkdir "$HOME/.zsh"; fi
    if [ ! -d "$HOME/.zsh/typewritten" ]; then
        git clone https://github.com/reobin/typewritten.git "$HOME/.zsh/typewritten"
    fi
}

main "$@"
