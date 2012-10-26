function git_prompt_info() {
    ref=`git symbolic-ref -q --short HEAD` || return
    echo "$ZSH_GIT_PROMPT_PREFIX$ref$(git_parse_dirty)$ZSH_GIT_PROMPT_POSTFIX"
}

function git_parse_dirty() {
    [[ -n "`git status -s -uno 2>/dev/null`" ]] && echo "$ZSH_GIT_PROMPT_DIRTY"
}
