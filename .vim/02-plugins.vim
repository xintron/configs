" Syntastic
let g:syntastic_mode_map = {'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['java', 'rst', 'html']}
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_javascript_jslint_conf = '--bitwise --debug --nomen --plusplus --maxlen 80 --browser --undef --sloppy'

let g:ctrlp_map = '<Leader>m'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$'
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 0

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
let g:snips_author = "Marcus Carlsson"

" TagList
let g:Tlist_Compact_Format = 1
let g:Tlist_Enable_Fold_Column = 0
let g:Tlist_WinWidth = 35
