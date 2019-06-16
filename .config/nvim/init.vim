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
if !isdirectory(expand('~/.cache/dein'))
    call mkdir(expand('~/.cache/dein'))
endif

if has("vim_starting")
    for f in split(globpath(split(&runtimepath, ',')[0], '*.vim'), '\n')
        if (f =~ '\v0[0-9].+\.vim')
            exe 'source'.f
        endif
    endfor
endif

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

    " Misc plugins
    call dein#add('Shougo/denite.nvim')
    call dein#add('Shougo/defx.nvim')

    call dein#add('neoclide/coc.nvim', {'merge':0, 'build': './install.sh nightly'})

    call dein#add('tpope/vim-surround')

    call dein#add('ervandew/supertab')

    " Language packs. Adds syntax, indent, ftplug for a ton of languages.
    call dein#add('sheerun/vim-polyglot')

    " Code styling
    call dein#add('Yggdroot/indentLine')

    " Colors
    call dein#add('morhetz/gruvbox')
    call dein#add('mhartington/oceanic-next')
    call dein#add('dracula/vim')
    call dein#add('arcticicestudio/nord-vim')
    call dein#add('joshdick/onedark.vim')

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

    call dein#add('editorconfig/editorconfig-vim')

    call dein#add('junegunn/vim-easy-align')

    " Python Plugins
    call dein#add('davidhalter/jedi-vim')

    " snippets
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('honza/vim-snippets')

    " PHP
    call dein#add('vim-php/vim-php-refactoring')

    " JavaScript (and the likes)
    call dein#add('othree/yajs.vim', { 'on_ft': ['javascript', 'javascript.jsx'] })
    call dein#add('othree/es.next.syntax.vim', { 'on_ft': ['javascript', 'javascript.jsx'] })
    call dein#add('maxmellon/vim-jsx-pretty', { 'on_ft': ['javascript', 'javascript.jsx'] })
    call dein#add('kchmck/vim-coffee-script', { 'on_ft': 'coffee' })
    call dein#add('elmcast/elm-vim', { 'on_ft': 'elm' })

    " CSS
    call dein#add('groenewege/vim-less')

    " Haskell
    call dein#add('neovimhaskell/haskell-vim', { 'on_ft': 'haskell' })

    " Go
    call dein#add('fatih/vim-go', { 'on_ft': 'go' })

    " LaTeX
    call dein#add('lervag/vimtex')

    " Syntax files
    call dein#add('chr4/nginx.vim', { 'on_ft': 'nginx' })
    call dein#add('plasticboy/vim-markdown', { 'on_ft': 'markdown' })
    call dein#add('robbles/logstash.vim')
    call dein#add('Matt-Deacalion/vim-systemd-syntax')
    call dein#add('saltstack/salt-vim')
    " call dein#add('stephpy/vim-yaml')
    call dein#add('Glench/Vim-Jinja2-Syntax')
    call dein#add('digitaltoad/vim-jade')
    call dein#add('cespare/vim-toml')

    call dein#end()
    call dein#save_state()
endif

" Enable *after* loading plugins
filetype plugin indent on
syntax on

colorscheme onedark
let g:airline_theme='onedark'
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
