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

# ls
alias ls='ls --group-directories-first --color=auto -h'
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
