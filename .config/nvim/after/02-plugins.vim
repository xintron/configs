" Unite {{{
call unite#filters#matcher_default#use(["matcher_context"])
call unite#filters#sorter_default#use(["sorter_rank"])
" }}}
" YouCompleteMe {{{
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.php = ['->', '::', '(', 'use ', 'namespace ', '\', '$']
" }}}
