# Platform detection (using built-in $OSTYPE to avoid forking)
case "$OSTYPE" in
    darwin*)    export IS_MACOS=1 ;;
    linux*)     export IS_LINUX=1 ;;
    *bsd*)      export IS_BSD=1 ;;
esac

# General zsh options
setopt autocd

# Fast compinit
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m-1) ]]; then
  compinit -C
else
  compinit
fi
