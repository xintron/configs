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

" Generate stuff in insert mode {{{
" Generate an identifier
imap <Leader>di <C-R>=system('date +"%s.%N" \| md5sum')[0:20]<CR>
imap <Leader>dts <C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR>
" }}}
" }}}

" Buffers, tabs and windows {{{
nmap <Leader># :b#<CR>
" }}}

" Plugin mappings {{{
" Unite mappings. Config for unite is in after/02-plugins.vim {{{
function! s:do_unite_search()
    if system("git rev-parse --is-inside-work-tree 2>/dev/null") == "true\n"
        execute "Unite -start-insert -direction=botright file_rec/git:-c:-o:--exclude-standard"
    else
        execute "Unite -start-insert -direction=botright file_rec/async:!"
    endif
endfunction
" The default should be to use the git-index for searching
nnoremap <C-p> :call <SID>do_unite_search()<cr>
nmap <Leader>ub :Unite -start-insert -direction=botright buffer:-<cr>
nmap <Leader>ut :Unite -start-insert -direction=botright tag<cr>
nmap <Leader>up :Unite -start-insert -direction=botright file_rec/async:!<cr>
" }}}
nmap <silent> - :VimFiler<CR>

nmap <silent> <Leader>t :TagbarOpenAutoClose<CR>
nmap <silent> <Leader>g :UndotreeToggle<CR>

" Syntastic mappings
nmap <silent> <Leader>e :Errors<CR>
" }}}
