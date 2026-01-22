### History settings
# HISTFILE: Path where command history is saved
export HISTFILE=~/.zsh_history
# HISTSIZE: Maximum number of commands to keep in memory
export HISTSIZE=100000
# SAVEHIST: Maximum number of commands to save to file
export SAVEHIST=100000
# EXTENDED_HISTORY: Include timestamps and execution time in history
setopt EXTENDED_HISTORY
# HIST_IGNORE_ALL_DUPS: Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_ALL_DUPS
# HIST_VERIFY: Don't execute immediately upon history expansion (like !!).
setopt HIST_VERIFY
# HIST_IGNORE_SPACE: Don't save commands starting with space
setopt HIST_IGNORE_SPACE
# INC_APPEND_HISTORY: Append each command to history file immediately
setopt INC_APPEND_HISTORY
# SHARE_HISTORY: Share history between all zsh sessions
setopt SHARE_HISTORY
