set -o vi

export EDITOR="vim"
if [ -n "$(command -v "vimpager")" ]; then
    export PAGER="vimpager"
elif [ -n "$(command -v "less")" ]; then
    export PAGER="less"
fi

ZLS_COLORS=$LS_COLORS
