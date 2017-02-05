" Author: Marcus Carlsson <hi@xintron.se>

if !isdirectory(expand('~/.config/nvim/tmp/'))
    call mkdir(expand('~/.config/nvim/tmp/backup/'), 'p', 0700)
    call mkdir(expand('~/.config/nvim/tmp/swap/'), 'p', 0700)
    call mkdir(expand('~/.config/nvim/tmp/undo/'), 'p', 0700)
endif
set backupdir=~/.config/nvim/tmp/backup/
set directory=~/.config/nvim/tmp/swap/
set undodir=~/.config/nvim/tmp/undo/

" Add dein to the runtime path
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if has("vim_starting")
    for f in split(globpath(split(&runtimepath, ',')[0], '*.vim'), '\n')
        if (f =~ '\v0[0-9].+\.vim')
            exe 'source'.f
        endif
    endfor
endif

if dein#load_state('~/.config/nvim/dein/')
    call dein#begin('~/.config/nvim/dein/')

    " This is added to load dein but we manage it ourselves (hence frozen)
    call dein#add('Shougo/dein.vim', {'frozen': 1})

    " Misc plugins
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/vimfiler.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/vimproc.vim', {'build': 'make'})

    call dein#add('tpope/vim-surround')

    call dein#add('mrtazz/simplenote.vim')
    call dein#add('ervandew/supertab')

    " Code styling
    call dein#add('Yggdroot/indentLine')

    " Colors
    call dein#add('morhetz/gruvbox')
    call dein#add('mhartington/oceanic-next')

    " Git
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('gregsexton/gitv')

    call dein#add('neomake/neomake')
    call dein#add('bling/vim-airline')
    call dein#add('rking/ag.vim')
    call dein#add('majutsushi/tagbar')
    call dein#add('mbbill/undotree')
    call dein#add('raimondi/delimitmate')

    call dein#add('luochen1990/rainbow')

    call dein#add('editorconfig/editorconfig-vim')
    call dein#add('godlygeek/tabular')

    " Python Plugins
    call dein#add('davidhalter/jedi-vim')
    call dein#add('SirVer/ultisnips')
    call dein#add('honza/vim-snippets')

    " PHP
    call dein#add('vim-php/vim-php-refactoring')
    call dein#add('mkusher/padawan.vim')
    call dein#add('joonty/vdebug')

    " JavaScript (and the likes)
    call dein#add('pangloss/vim-javascript')
    call dein#add('gkz/vim-ls') " LiveScript support
    call dein#add('kchmck/vim-coffee-script')
    call dein#add('justinj/vim-react-snippets')
    call dein#add('mxw/vim-jsx')
    call dein#add('isRuslan/vim-es6')
    call dein#add('othree/yajs.vim', { 'on_ft': 'javascript' })
    call dein#add('gavocanov/vim-js-indent')
    call dein#add('elmcast/elm-vim')
    call dein#add('elzr/vim-json')
    " Used for javascript Tern completion
    call dein#add('ternjs/tern_for_vim', {'build': 'source ~/.nvm/nvm.sh && npm install'})

    " CSS
    call dein#add('groenewege/vim-less')

    " Haskell
    call dein#add('eagletmt/neco-ghc')
    call dein#add('eagletmt/ghcmod-vim')
    call dein#add('neovimhaskell/haskell-vim')

    " Go
    call dein#add('fatih/vim-go')
    call dein#add('zchee/deoplete-go', {'build': 'make'})

    " LaTeX
    call dein#add('lervag/vimtex')

    " Syntax files
    call dein#add('evanmiller/nginx-vim-syntax')
    call dein#add('plasticboy/vim-markdown')
    call dein#add('robbles/logstash.vim')
    call dein#add('Matt-Deacalion/vim-systemd-syntax')
    call dein#add('saltstack/salt-vim')
    call dein#add('stephpy/vim-yaml')
    call dein#add('Glench/Vim-Jinja2-Syntax')
    call dein#add('digitaltoad/vim-jade')
    call dein#add('cespare/vim-toml')

    call dein#end()
    call dein#save_state()
endif

" Enable *after* loading plugins
filetype plugin indent on
syntax on

colorscheme gruvbox
let g:airline_theme='gruvbox'
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
