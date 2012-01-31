" Override for wombat256 (maybe a global override since changing the terminal
" background for linenumbers is annoying
if exists('g:colors_name') && g:colors_name == 'wombat256'
    hi LineNr ctermbg=none
endif
