# the circus arrives without warning.
export CIRCUS=$HOME/.circus

# path
export PATH="/usr/local/bin:$HOME/.circus:$PATH"

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

PROMPT_EOL_MARK=""

# pywal
[ -f ~/.cache/wal/sequences ] && (cat ~/.cache/wal/sequences &)

# padding bc ocd
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

# aliases
alias :q="exit"
alias q="exit"
alias circus="cd $CIRCUS"

# echo ".dots" >> .gitignore
# git clone --bare https://github.com/mofeimw/.dots $HOME/.dots
# dots checkout
alias dots="/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME"

# load local config
if [ -f ~/.zsh_local ]; then
    source ~/.zsh_local
fi
