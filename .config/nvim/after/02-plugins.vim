" YouCompleteMe {{{
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.php = ['->', '::', '(', 'use ', 'namespace ', '\', '$']
" }}}
" Denite {{{
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<Esc>', '<denite:quit>', 'noremap')

" Specify git search
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '--cached', '--others', '--exclude-standard'])
" }}}
