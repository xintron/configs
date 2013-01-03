function git_prompt_info() {
    ref=`git symbolic-ref -q --short HEAD 2>/dev/null` || return
    echo "$ZSH_GIT_PROMPT_PREFIX$ref$(git_parse_dirty)$(git_sha)$ZSH_GIT_PROMPT_POSTFIX"
}

function git_parse_dirty() {
    [[ -n "`git status -s -uno 2>/dev/null`" ]] && echo "$ZSH_GIT_PROMPT_DIRTY"
}

function git_sha() {
    sha=`git rev-parse --short HEAD 2>/dev/null` || return
    echo "$ZSH_GIT_SHA_PREFIX$sha$ZSH_GIT_SHA_POSTFIX"
}
