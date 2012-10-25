" Syntastic
let g:syntastic_mode_map = {'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': []}
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

let g:ctrlp_map = '<Leader>m'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$'
let g:ctrlp_show_hidden = 1

" indent
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 3
let g:indent_guides_enable_on_vim_startup = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
