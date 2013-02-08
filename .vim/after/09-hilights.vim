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

hi LineNr ctermbg=none ctermfg=2

" Position color
hi User1 ctermfg=0 ctermbg=4
" formatoptions
hi User2 ctermfg=0 ctermbg=9
" line color
hi User3 ctermfg=0 ctermbg=2
" column color
hi User4 ctermfg=0 ctermbg=5
" warning color
hi User5 ctermfg=0 ctermbg=1
" Filetype
hi User6 ctermfg=0 ctermbg=7
