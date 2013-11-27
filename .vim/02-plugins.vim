" Syntastic
let g:syntastic_mode_map = {'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['java', 'rst', 'html']}
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_javascript_jslint_conf = '--bitwise --debug --nomen --plusplus --maxlen 80 --browser --undef --sloppy'

let g:ctrlp_map = '<Leader>mm'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$'
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_extensions = ['line', 'tag', 'buffertag']

" indent
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 3
let g:indent_guides_enable_on_vim_startup = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235

" UltiSnips
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snippets']
let g:UltiSnipsSnippetsDir = split(&runtimepath, ',')[0] . '/snippets/'
let g:UltiSnipsListSnippets = "<Leader>s"
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:snips_author = "Marcus Carlsson"

" Tagbar
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

" Neocomplete
let g:neocomplete#enable_at_startup = 1

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
