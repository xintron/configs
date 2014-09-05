" Unite {{{
call unite#filters#matcher_default#use(["matcher_fuzzy"])
if has("ruby")
    call unite#filters#sorter_default#use(["sorter_selecta"])
else
    call unite#filters#sorter_default#use(["sorter_rank"])
endif
" }}}
