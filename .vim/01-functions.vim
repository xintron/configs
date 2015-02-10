function! SynStack()
    if !exists('*synstack')
        return
    endif
    echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunction

function! ToggleBackground()
    if &background == "dark"
        set background=light
    else
        set background=dark
    endif
    hi clear SignColumn
    " This is stupid but needed to have gitgutter play nice
    if exists("*gitgutter#highlight#define_highlights")
        call gitgutter#highlight#define_highlights()
    endif
endfunction
