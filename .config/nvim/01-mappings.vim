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

nmap <silent> <Leader><Space> :nohl<CR>:Mark<CR>
nmap <C-h>h :call SynStack()<CR>

" C-] doesn't work under OS X for some reason. This is one way of solving it.
nmap <Leader>] <C-]>

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
" }}}

" Buffers, tabs and windows {{{
nmap <Leader># :b#<CR>
" }}}

" Plugin mappings {{{
" Unite mappings. Config for unite is in after/02-plugins.vim {{{
function! s:do_unite_search()
    if system("git rev-parse --is-inside-work-tree 2>/dev/null") == "true\n"
        execute "Unite -start-insert -toggle -force-redraw file_rec/git:--cached:--others:--exclude-standard"
    else
        if has('nvim')
            execute "Unite -start-insert -toggle file_rec/neovim:!"
        else
            execute "Unite -start-insert -toggle file_rec/async:!"
        endif
    endif
endfunction
" The default should be to use the git-index for searching
nnoremap <C-p> :call <SID>do_unite_search()<cr>
nmap <Leader>ub :Unite -start-insert -toggle buffer:-<cr>
nmap <Leader>ut :Unite -start-insert -toggle tag<cr>
nmap <Leader>ud :Unite -start-insert -toggle -hide-source-names file file/new directory/new<cr>
if has('nvim')
    nmap <Leader>up :Unite -start-insert -toggle file_rec/neovim:!<cr>
else
    nmap <Leader>up :Unite -start-insert -toggle file_rec/async:!<cr>
endif
" }}}
nmap <silent> - :VimFiler<CR>

nmap <silent> <Leader>t :TagbarOpenAutoClose<CR>
nmap <silent> <Leader>g :UndotreeToggle<CR>

" Syntastic mappings
nmap <silent> <Leader>e :Errors<CR>
" }}}
