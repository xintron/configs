" Somewhere in neovim they're overriding this from the .vim/00-settings.vim
" file. This is a workaround to fix it.
set noautochdir

" Allow transparent background
hi! Normal ctermbg=none guibg=none

" Syntax overrides {{{
" This fixes a nicer look for Haskell code (by highlighting more things instead
" of using the default color
hi! link haskellType GruvboxYellow
hi! link haskellIdentifier GruvboxOrange

hi! link yamlPlainScalar String
" }}}
