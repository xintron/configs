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

" Plugins {{{
if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim', {'frozen': 1})

    " Misc plugins
    call dein#add('Shougo/denite.nvim')
    call dein#add('Shougo/defx.nvim')

    let g:coc_global_extensions = ['coc-python', 'coc-tsserver', 'coc-json', 'coc-snippets']
    call dein#add('neoclide/coc.nvim', {'merge':0, 'build': './install.sh nightly'})

    call dein#add('tpope/vim-surround')

    call dein#add('ervandew/supertab')

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

    " snippets
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('honza/vim-snippets')

    " PHP
    call dein#add('vim-php/vim-php-refactoring')

    " JavaScript (and the likes)
    call dein#add('othree/yajs.vim', { 'on_ft': ['javascript', 'javascript.jsx'] })
    call dein#add('HerringtonDarkholme/yats.vim', { 'on_ft': ['typescript'] })
    call dein#add('othree/es.next.syntax.vim', { 'on_ft': ['javascript', 'javascript.jsx'] })
    call dein#add('maxmellon/vim-jsx-pretty', { 'on_ft': ['javascript', 'javascript.jsx'] })
    call dein#add('kchmck/vim-coffee-script', { 'on_ft': 'coffee' })
    " Elm
    call dein#add('andys8/vim-elm-syntax', { 'on_ft': 'elm' })
    call dein#add('elm-tooling/elm-language-server', { 'on_ft': 'elm' })

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
" }}}

" Enable *after* loading plugins
filetype plugin indent on
syntax enable

" Theme {{{
colorscheme dracula
let g:airline_theme='dracula'
set background=dark

hi User1 ctermfg=0 ctermbg=6
hi User2 ctermfg=0 ctermbg=9
hi User3 ctermfg=0 ctermbg=2
hi User4 ctermfg=0 ctermbg=5
hi User5 ctermfg=0 ctermbg=1
hi User6 ctermfg=0 ctermbg=7
" }}}

" Denite {{{
" Settings {{{
call denite#custom#option('default', {
    \ 'auto_resize': 1,
    \ 'prompt': 'λ:',
    \ 'direction': 'rightbelow',
    \ 'winminheight': '10',
    \ 'highlight_matched_char': 'Function',
    \ 'highlight_matched_range': 'Normal'
    \ })

" Specify git search
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '--cached', '--others', '--exclude-standard'])

if executable('rg')
    call denite#custom#var('file/rec', 'command',
        \['rg', '--files', '--glob', '!.git', '!node_modules'])

    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep', '--no-heading'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
endif

" }}}
" Mappings {{{
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
endfunction
nnoremap <silent> <C-p> :Denite `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'` -start-filter<cr>
nmap <Leader>ub :Denite buffer -start-filter<cr>
nmap <Leader>ut :Denite tag -start-filter<cr>
nmap <Leader>ug :Denite grep<cr>
" }}}
" }}}
" Defx {{{
nnoremap <silent> - :Defx<cr>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
    \ defx#do_action('open')
    nnoremap <silent><buffer><expr> c
    \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
    \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
    \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
    \ defx#do_action('open')
    nnoremap <silent><buffer><expr> E
    \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
    \ defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> o
    \ defx#do_action('open_or_close_tree')
    nnoremap <silent><buffer><expr> K
    \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
    \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
    \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
    \ defx#do_action('toggle_columns',
    \                'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
    \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
    \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
    \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
    \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
    \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
    \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
    \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
    \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
    \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
    \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
    \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
    \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
    \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
    \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
    \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
    \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
    \ defx#do_action('change_vim_cwd')
endfunction
" }}}
" coc {{{
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> <leader>gk :call CocAction('doHover')<cr>
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gy <Plug>(coc-type-definition)

nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)

nnoremap <silent> <space>go  :<C-u>CocList diagnostics<cr>
" }}}

for f in split(globpath(split(&runtimepath, ',')[0], 'after/*.vim'), '\n')
    if (f =~ '\v0[0-9].+\.vim')
        exe 'source'.f
    endif
endfor
