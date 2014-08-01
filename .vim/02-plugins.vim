" Syntastic {{{
let g:syntastic_mode_map = {'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['java', 'rst', 'html']}
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_javascript_jslint_conf = '--bitwise --debug --nomen --plusplus --maxlen 80 --browser --undef --sloppy'
" }}}
" CtrlP {{{
let g:ctrlp_map = '<Leader>pm'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$'
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_extensions = ['line', 'tag', 'buffertag']
" }}}
" UltiSnips {{{
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "mysnippets"]
let g:UltiSnipsSnippetsDir = split(&runtimepath, ',')[0] . '/mysnippets/'
let g:UltiSnipsListSnippets = "<c-u>"
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:snips_author = "Marcus Carlsson"
" }}}
" Tagbar {{{
let g:tagbar_width = 25
let g:tagbar_compact = 1
let g:tagbar_left = 1

let g:tagbar_type_php = {
    \ 'kinds' : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions:0:0',
        \ 'f:functions',
    \ ],
\ }
" }}}
" Neocomplete {{{
let g:neocomplete#enable_at_startup = 1
" }}}
" Supertab {{{
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}
" Jedi {{{
" This doesn't work well with neocomplete
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0
" }}}
" ghc-mod {{{
let g:ghcmod_max_preview_size=5
let g:ghcmod_ghc_options = ['-ilib', '-isrc', '-i.', '-idist/build/autogen', '-Wall', '-fwarn-unused-do-bind']
" }}}
" airline {{{
let g:airline_left_sep=''
let g:airline_right_sep=''
" }}}
