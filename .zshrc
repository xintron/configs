#LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
 

. $HOME/.zsh/xintron.theme
. $HOME/.zsh/alias
. $HOME/.zsh/bindkey
. $HOME/.zsh/functions
 
# History
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=2000
 
# Dircolors
eval $(dircolors -b ~/.dircolors)
 
#export TERM='rxvt-256color'
 
TZ='Europe/Stockholm'; export TZ
 
# path
export PATH=~/bin:/usr/lib/perl5/vendor_perl/bin/:$PATH:/opt/android-sdk/tools:/usr/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/libexec:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/usr/lib/go-openoffice/program/
 
# manpath
export MANPATH=$MANPATH:/usr/local/man:/opt/local/share/man
 
# abbreviation for later use
export EDITOR=vim
export PAGER=less

# OPTIONS
setopt vi
setopt PROMPT_SUBST
setopt autopushd
setopt NOTIFY
setopt APPEND_HISTORY
unsetopt BG_NICE        # do NOT nice bg commands
setopt EXTENDED_HISTORY     # puts timestamps in the history
setopt HASH_CMDS        # turns on hashing
setopt HIST_ALLOW_CLOBBER
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt ALL_EXPORT
 
# Set/unset  shell options
setopt   notify globdots pushdtohome cdablevars autolist
setopt   autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent noclobber
setopt   autopushd pushdminus rcquotes mailwarning
unsetopt bgnice autoparamslash
setopt NOEXTENDED_GLOB
 
# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
#zmodload -ap zsh/mapfile mapfile
 
# completion
autoload -U compinit
compinit

#  completion
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:processes' command 'ps -axw'
zstyle ':completion:*:processes-names' command 'ps -awxho command'
# Completion Styles
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# command for process lists, the local web server details and host completion
zstyle '*' hosts $hosts
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr

if [ -d /home/xintron/python/env/ ]; then
    export WORKON_HOME=/home/xintron/python/env/
    if [ -f /usr/bin/virtualenvwrapper.sh ]; then
        . /usr/bin/virtualenvwrapper.sh
    fi
fi
