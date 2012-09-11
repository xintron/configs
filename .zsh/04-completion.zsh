zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:complete:*' cache-path $ZSH_HOME/cache/
zstyle ':completion:*:complete:*' use-cache true

zstyle ':completion:*' menu select
zstyle ':completion:*:*:users' ignored-patterns avahi bin daemon dbus ftp mail nobody

# Redirects
zstyle ':completion:*:*:-redirect-,2>,*:*' file-patterns '*.(log|txt)' '%p:all_files'
zstyle ':completion:*:*:-redirect-,2>>,*:*' file-patterns '*.(log|txt)' '%p:all_files'
zstyle ':completion:*:*:-redirect-,>,*:*' file-patterns '*.(log|txt)' '%p:all_files'
zstyle ':completion:*:*:-redirect-,>>,*:*' file-patterns '*.(log|txt)' '%p:all_files'
