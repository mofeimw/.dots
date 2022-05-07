# prompt
TYPEWRITTEN_DISABLE_RETURN_CODE="true"
TYPEWRITTEN_SYMBOL="$"

fpath+=$HOME/.zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten

# config
source ~/.circus/z

export EDITOR=vim
export VISUAL=vim

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# padding for ocd
precmd() {
    eval "precmd() { echo }"
}

# uh i'm lazy
run() {
    name=${PWD##*/}
    [ -f main.sh ] && { ./main.sh "$@"; return 0 }
    [ -f main ] && { ./main "$@"; return 0 }
    [ -f "$name" ] && ./$name "$@"
}

edit() {
    name=${PWD##*/}
    [ -f main.sh ] && { vim main.sh; return 0 }
    [ -f "$name" ] && vim "$name" || {
        for file in main*; {
            vim "$file"
            break
        }
    }
}

# color theme
colors() {
    clear
    for i in {0..7}; do
        printf '\033[4%sm    ' $i
    done
    echo
}

# aliases
alias :q="exit"
alias q="exit"

# path
export PATH="/usr/local/bin:$HOME/.circus:$PATH"

# load local config
source ~/.zsh_local
