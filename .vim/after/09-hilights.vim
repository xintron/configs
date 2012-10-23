" Override for wombat256 (maybe a global override since changing the terminal
" background for linenumbers is annoying
if exists('g:colors_name') && g:colors_name == 'wombat256'
    hi LineNr ctermbg=none
endif

if exists('g:colors_name') && g:colors_name == 'molokai'
    hi Normal ctermbg=none
    hi LineNr ctermbg=none
endif

hi IndentGuidesOdd ctermbg=233
hi IndentGuidesEven ctermbg=234

" Default statusline-color
hi User1 term=bold cterm=bold ctermfg=202 ctermbg=233
" Options color
hi User2 term=bold cterm=bold ctermfg=10 ctermbg=233
" Warning color
hi User3 term=bold cterm=bold ctermfg=9 ctermbg=233
