function _x_git_prompt_info() {
    [ "$(\git rev-parse --is-inside-work-tree 2> /dev/null)" != "true" ] && return 1

    echo "$(_x_git_branch)$(_x_git_parse_dirty)$(_x_git_sha)"
}

function _x_git_parse_dirty() {
    if [ -n "$(\git ls-files --other --exclude-standard 2> /dev/null)" ]; then
        echo " %{$fg[cyan]%}*%{$reset_color%}"
    fi
}

function _x_git_sha() {
    sha=`\git rev-parse --short HEAD 2>/dev/null` || return
    echo " %{$fg[blue]%}$sha%{$reset_color%}"
}

function _x_git_branch() {
    local branch ret
    branch=`\git symbolic-ref -q --short HEAD 2>/dev/null` || return
    # Do we have untracked files?
    if [ -n "`\git status -s -uno 2>/dev/null`" ]; then
        local stats ins dels
        stats=$(\git diff --shortstat 2>/dev/null)
        # Count insertions
        [[ "$stats" = *insertion* ]] && ins=${${stats/*changed, }/ insert*} || ins=0
        [[ "$stats" = *deletion* ]] && dels=${${stats/*, }/ del*} || dels=0
        ret="%{$fg[red]%}$branch %{$fg[green]%}+$ins%{$reset_color%}/%{$fg[red]%}-$dels%{$reset_color%}"
    else
        local remote
        remote=$(\git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2> /dev/null)
        # Color it yellow if we are ahead/bedinh
        if [ -n "$remote" ] && [[ $(\git rev-list --no-merges --count $remote..HEAD 2> /dev/null) -gt 0 ]]; then
            ret="%{$fg[yellow]%}$branch%{$reset_color%}"
        fi
    fi
    [ -z "$ret" ] && echo -ne "%{$fg[green]%}$branch%{$reset_color%}" || echo -ne $ret
}
