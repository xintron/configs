" Author: Marcus Carlsson <hi@xintron.se>

if !isdirectory(expand('~/.vim/tmp/'))
    call mkdir(expand('~/.vim/tmp/backup/'), 'p', 0700)
    call mkdir(expand('~/.vim/tmp/swap/'), 'p', 0700)
    call mkdir(expand('~/.vim/tmp/undo/'), 'p', 0700)
endif
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/
set undodir=~/.vim/tmp/undo/

if has("vim_starting")
    " Needed for neobundle to work
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    for f in split(globpath(split(&runtimepath, ',')[0], '*.vim'), '\n')
        if (f =~ '\v0[0-9].+\.vim')
            exe 'source'.f
        endif
    endfor
endif

call neobundle#begin(expand("~/.vim/bundle/"))
NeoBundleFetch "Shougo/neobundle.vim"


" Misc plugins
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/vimfiler.vim"
NeoBundle "Shougo/vimproc.vim", {
    \ "build": {
    \       "mac": "make -f make_mac.mak",
    \       "unix": "make -f make_unix.mak"
    \   },
    \ }

NeoBundle "tpope/vim-surround"

NeoBundle "Shougo/neocomplete.vim"

" Git
NeoBundle "tpope/vim-fugitive"
NeoBundle "airblade/vim-gitgutter"

NeoBundle "scrooloose/syntastic"
NeoBundle "bling/vim-airline"
NeoBundle "ervandew/supertab"
NeoBundle "rking/ag.vim"
NeoBundle "majutsushi/tagbar"
NeoBundle "mbbill/undotree"
NeoBundle "Mark"
NeoBundle "tsukkee/unite-tag"
NeoBundle "raimondi/delimitmate"

NeoBundle "Lokaltog/vim-easymotion"

NeoBundle "joonty/vdebug"
NeoBundle "editorconfig/editorconfig-vim"
NeoBundle "godlygeek/tabular"
NeoBundle "nathanaelkane/vim-indent-guides"

" Python Plugins
NeoBundle "davidhalter/jedi-vim"
NeoBundle "SirVer/ultisnips"
NeoBundle "honza/vim-snippets"

" PHP
NeoBundle "StanAngeloff/php.vim"
NeoBundle "shawncplus/phpcomplete.vim"
NeoBundle "rayburgemeestre/phpfolding.vim"

" JavaScript (and the likes)
NeoBundle "gkz/vim-ls" " LiveScript support
NeoBundle "kchmck/vim-coffee-script"

" CSS
NeoBundle "groenewege/vim-less"

" Haskell
NeoBundle "eagletmt/ghcmod-vim", "master"
NeoBundle "eagletmt/neco-ghc"
NeoBundle "Twinside/vim-hoogle"
NeoBundle "raichoo/haskell-vim"

" Go
NeoBundle 'fatih/vim-go'

" Syntax files
NeoBundle "evanmiller/nginx-vim-syntax"
NeoBundle "tpope/vim-markdown"
NeoBundle "pangloss/vim-javascript"
NeoBundle "robbles/logstash.vim"
NeoBundle "Matt-Deacalion/vim-systemd-syntax"

call neobundle#end()
NeoBundleCheck

" Enable *after* loading plugins
filetype plugin indent on
syntax on

let base16colorspace=256
colorscheme base16-monokai
set background=dark

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
