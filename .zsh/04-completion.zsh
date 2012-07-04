zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:complete:*' cache-path $ZSH_HOME/cache/
zstyle ':completion:*:complete:*' use-cache true

zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' menu select
zstyle ':completion:*:*:users' ignored-patterns avahi bin daemon dbus ftp mail nobody
