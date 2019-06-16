" YouCompleteMe {{{
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.php = ['->', '::', '(', 'use ', 'namespace ', '\', '$']
" }}}
" Denite {{{
let s:denite_options = {'default' : {
\ 'auto_resize': 1,
\ 'prompt': 'λ:',
\ 'direction': 'rightbelow',
\ 'winminheight': '10',
\ 'highlight_mode_insert': 'Visual',
\ 'highlight_mode_normal': 'Visual',
\ 'prompt_highlight': 'Function',
\ 'highlight_matched_char': 'Function',
\ 'highlight_matched_range': 'Normal'
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)

call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<Esc>', '<denite:quit>', 'noremap')

" Specify git search
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '--cached', '--others', '--exclude-standard'])
" }}}
