# git aliases
alias g='git'
alias gc='git commit'
alias gco='git checkout'
alias gs='git status -s'
alias gss='git status'
alias gd='git diff'
alias gds='git --no-pager diff --stat'
alias gdd='git --no-pager diff --dirstat'
alias ga='git add'
alias gb='git branch'
alias gps='git push'
alias gpl='git pull'
alias gr='git rebase'

# ls
if [ $OSX -eq 0 ]; then
    alias ls='ls --group-directories-first --color=auto -h'
else
    if [ -x '/Applications/VLC.app/Contents/MacOS/VLC' ]; then
        alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
        alias cvlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'
    fi
    alias ls='ls -h'
fi
alias la='ls -lA'
alias lsa='ls -A'
alias lsf='ls -A *(-.N)'
alias lsff='ls -A *(-.DN)' # show dotfiles
alias lsd='ls -Ad *(-/N)'
alias lsdd='ls -Ad *(-/DN)'

# misc
alias cp='cp -vi'
alias mv='mv -vi'
alias rm='rm -v'
alias c='clear'
alias ..='cd ..'
alias -- -='pushd -'
alias vp='vimpager'
alias df='df -h'
alias du='du -h'
alias c256='for i in {0..255}; do echo -e "\e[38;05;${i}m  ░▒▓██▓▒░ \e[0m${i}"; done | column -c 70 -s" "; echo -e "\e[m"'
alias pps='ps -eo pid,time,%cpu,%mem,comm --sort=-%cpu,+%mem'

alias jurl='curl -H "Content-Type: application/json"'
alias wurl='curl -w "Status: %{http_code}\nConnect: %{time_connect}\nTTFB: %{time_starttransfer}\nTime total: %{time_total}"'

# Virtualenv-fix
if [ -d /home/xintron/python/env/ ]; then
    export WORKON_HOME=/home/xintron/python/env/
    if [ -f /usr/bin/virtualenvwrapper.sh ]; then
        alias pyenv='. /usr/bin/virtualenvwrapper.sh'
    fi
fi
