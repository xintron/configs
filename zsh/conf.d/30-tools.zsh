### Interactive Tools

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide for faster dir jumping
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi
