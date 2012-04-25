function git_prompt_info() {
    ref=`git symbolic-ref HEAD 2> /dev/null` || return
    echo "$ZSH_GIT_PROMPT_PREFIX${ref#refs/heads/}$(git_parse_dirty)$ZSH_GIT_PROMPT_POSTFIX"
}

function git_parse_dirty() {
    [[ -n "`git status -s --ignore-submodules -uno 2>/dev/null`" ]] && echo "$ZSH_GIT_PROMPT_DIRTY"
}
