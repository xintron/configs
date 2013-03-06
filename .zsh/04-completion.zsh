zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:complete:*' cache-path $ZSH_HOME/cache/
zstyle ':completion:*:complete:*' use-cache true

zstyle ':completion:*' menu select
zstyle ':completion:*:*:users' ignored-patterns \
    avahi bin daemon dbus ftp mail nobody dnsmasq \
    kdm mongodb mysql ntp polkitd rtkit usbmux uuidd

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
