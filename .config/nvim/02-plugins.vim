" Syntastic {{{
let g:syntastic_mode_map = {'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['java', 'rst', 'html']}
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_javascript_jslint_conf = '--bitwise --debug --nomen --plusplus --maxlen 80 --browser --undef --sloppy'
let g:syntastic_php_phpcs_args = '--standard=psr2 -n'

let g:syntastic_error_symbol            = '✖'
let g:syntastic_warning_symbol          = '►'
let g:syntastic_style_error_symbol      = '✖'
let g:syntastic_style_warning_symbol    = '►'
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
let g:airline_powerline_fonts = 1
" }}}
" vimfiler {{{
let g:vimfiler_as_default_explorer = 1
" }}}
" undotree {{{
let g:undotree_WindowLayout = 2
" }}}
" Rainbow {{{
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'ctermfgs': ['green', 'blue', 'magenta', 'yellow']
\}
" }}}
" YouCompleteMe {{{
let g:ycm_autoclose_preview_window_after_completion = 1
" }}}
" indentLine {{{
let g:indent_guides_default_mapping = 0
let g:indentLine_enabled = 1
let g:indentLine_char = '┆'
" }}}
" deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.elm = ['\.']
" }}}
" jsx {{{
let g:jsx_ext_required = 0
" }}}
" javascript {{{
let g:javascript_conceal = 1
let g:javascript_conceal_function = "λ"
let g:javascript_conceal_this = "@"
let g:javascript_conceal_return = "<"
let g:javascript_conceal_prototype = "#"
" }}}
" gruvbox {{{
let g:gruvbox_contrast_dark = "hard"
" }}}
" markdown {{{
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
" }}}
" Neomake {{{
autocmd BufWritePost * Neomake

" Enable for elm parsing
"let g:neomake_elm_elmmake_maker = {
"  \ 'exe': 'elm-make',
"  \ 'buffer_output': 1,
"  \ 'errorformat':
"    \ '%E%.%#--\ %m\ -%# %f' . ',' .
"    \ '%C%l\\|' . ',' .
"    \ '%C%.%#'
"\ }
"
"" enable elm-make on elm
"let g:neomake_elm_enabled_makers = [ 'elmmake' ]
" }}}

if filereadable(expand('~').'/.simplenoterc')
        exec 'source ' . expand('~') . '/.simplenoterc'
endif
