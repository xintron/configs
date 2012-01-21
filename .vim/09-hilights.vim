" Override for wombat256 (maybe a global override since changing the terminal
" background for linenumbers is annoying
if g:colors_name == 'wombat256'
    hi LineNr ctermbg=none
endif
