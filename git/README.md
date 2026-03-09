# Git Config

`gitconfig.base` contains shareable git settings (tooling, diff, merge). Machine-specific
settings (user, email) live in `~/.gitconfig` and are not versioned.

## New Machine Setup

Add this to `~/.gitconfig`:

```ini
[user]
    name = Your Name
    email = your@email.com

[include]
    path = ~/git/configs/git/gitconfig.base
```
