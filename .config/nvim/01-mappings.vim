let mapleader="\<Space>"

" Misc {{{
"
" Better search {{{
nnoremap n nzzzv
nnoremap N Nzzzv
" }}}
"
nmap <Leader>p :set paste!<CR>

nmap <silent> <Leader>ft :exe 'set fo'.(&fo =~ 't' ? '-=t' : '+=t')<CR>
nmap <Leader>cc :exe 'set colorcolumn='.(&colorcolumn == '' ? '+1' : '')<CR>

nmap <silent> <Leader><Space> :nohl<CR>
nmap <C-h>h :call SynStack()<CR>

" C-] doesn't work under OS X for some reason. This is one way of solving it.
noremap <Leader>] <C-]>
" Map terminal escape sequence which dosen't work well with Svorak A5
tnoremap <Esc> <C-\><C-n>

" QuickFix mappings
nmap <silent> <Leader>co :copen<CR>
nmap <silent> <Leader>cl :cclose<CR>
nmap <silent> <Leader>cn :cnext<CR>
nmap <silent> <Leader>cp :cprevious<CR>

nmap <silent> <Leader>lo :lopen<CR>
nmap <silent> <Leader>lc :lclose<CR>
nmap <silent> <Leader>ln :lnext<CR>
nmap <silent> <Leader>lp :lprevious<CR>
" }}}

" Buffers, tabs and windows {{{
nmap <Leader># :b#<CR>
" }}}

" Plugin mappings {{{
" Denite mappings. Configuration for denite is placed in after/02-plugins.vim {{{
function! s:do_unite_search()
    if system("git rev-parse --is-inside-work-tree 2>/dev/null") == "true\n"
        execute "Denite file/rec/git"
    else
        execute "Denite file/rec"
    endif
endfunction
" The default should be to use the git-index for searching
nnoremap <C-p> :call <SID>do_unite_search()<cr>
nmap <Leader>ub :Denite buffer:-<cr>
nmap <Leader>ut :Denite tag<cr>
nmap <Leader>ud :Denite file file/new directory/new<cr>
nmap <Leader>up :Denite file/rec<cr>
" }}}
nmap <silent> - :VimFiler<CR>

nmap <silent> <Leader>t :TagbarOpenAutoClose<CR>
nmap <silent> <Leader>g :UndotreeToggle<CR>

" Syntastic mappings
nmap <silent> <Leader>e :Errors<CR>
" }}}

" Haskell {{{
" Bindings that will only be applied for haskell files
augroup interoMaps
    au!

    au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
    au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

    au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
    au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

    " Re-evaluate the file
    au BufWritePost *.hs InteroReload

    au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
    au FileType haskell map <silent> <leader>T <Plug>InteroType
" }}}
