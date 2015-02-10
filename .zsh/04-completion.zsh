zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:complete:*' use-cache true
zstyle ':completion:*:complete:*' cache-path $ZSH_HOME/cache/

# Case insensitive search and right/left path search
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' '+r:|[._-]=* r:|=*' '+l:|=* r:|=*'


# Use verbose output for the completion system for all commands by default.
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' verbose true

zstyle ':completion:*' menu select yes=long
zstyle ':completion:*:*:users' ignored-patterns \
    avahi bin daemon dbus ftp mail nobody dnsmasq \
    kdm mongodb mysql ntp polkitd rtkit usbmux uuidd

# Group output of suggestions
# Group based on the name of the tag
zstyle ':completion:*' group-name ''
# Color the groups
zstyle ':completion:*' format '-- %F{green}%d%f --'
zstyle ':completion:*:warnings' format '## %F{red} WARNING - No matches found%f ##'
# Scroll completion suggestions
zstyle ':completion:*:default' list-prompt '%S-- %p -- [%m]%s'
zstyle ':completion:*:default' select-prompt '%F{green}%S-- %p -- [%m]%s%f'

# Command specific
zstyle ':completion:*:*:git-(push|pull):*' group-order remotes heads

zstyle ':completion::*:-tilde-:*:*' group-order named-directories users

zstyle ':completion:*:manuals' separate-sections true

# Descriptions for completion
zstyle ':completion:*:processes' command 'ps -eopid,user,comm'
zstyle ':completion:*:processes-names' command 'ps -eocomm'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#) ([^ ]#)*=0=$color[red]=$color[blue]"

[ -r $HOME/.ssh/known_hosts ] && _ssh_known_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[[]*}%%\ *}%%,*}) || _ssh_known_hosts=()
[ -r $HOME/.ssh/config ] && _ssh_config_hosts=(${(s: :)${(ps:\t:)${(f)"$(<$HOME/.ssh/config|grep '^[Hh]ost\s')"}#[Hh]ost }}) || _ssh_config_hosts=()
hosts=(
    "$_ssh_known_hosts[@]"
    "$_ssh_config_hosts[@]"
    "$HOST"
    localhost
)
zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*:hosts' list-colors "=(#b) #(([0-9]#.[0-9]#.[0-9]#.[0-9]#)|([a-z0-9]#))=0=$color[red]=$color[blue]"

# Redirects
zstyle ':completion:*:*:-redirect-,2>,*:*' file-patterns '*.(log|txt)' '%p:all_files'
zstyle ':completion:*:*:-redirect-,2>>,*:*' file-patterns '*.(log|txt)' '%p:all_files'
zstyle ':completion:*:*:-redirect-,>,*:*' file-patterns '*.(log|txt)' '%p:all_files'
zstyle ':completion:*:*:-redirect-,>>,*:*' file-patterns '*.(log|txt)' '%p:all_files'
