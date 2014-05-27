" Author: Marcus Carlsson <hi@xintron.se>

if !isdirectory('/tmp/xintron/vim')
    call mkdir('/tmp/xintron/vim', 'p', 0700)
endif

for f in split(globpath(split(&runtimepath, ',')[0], '*.vim'), '\n')
    if (f =~ '\v0[0-9].+\.vim')
        exe 'source'.f
    endif
endfor

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Enable *after* loading pathogen plugins
filetype plugin indent on
syntax on

colorscheme Tomorrow-Night

hi User1 ctermfg=0 ctermbg=6
hi User2 ctermfg=0 ctermbg=9
hi User3 ctermfg=0 ctermbg=2
hi User4 ctermfg=0 ctermbg=5
hi User5 ctermfg=0 ctermbg=1
hi User6 ctermfg=0 ctermbg=7

for f in split(globpath(split(&runtimepath, ',')[0], 'after/*.vim'), '\n')
    if (f =~ '\v0[0-9].+\.vim')
        exe 'source'.f
    endif
endfor
