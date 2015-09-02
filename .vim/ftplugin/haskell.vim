" ghc-mod
nmap <silent> <Space>ht :GhcModType!<CR>
nmap <silent> <Space>hc :GhcModTypeClear<CR>
nmap <silent> <Space>hi :GhcModInfo<CR>

let g:haskell_enable_pattern_synonyms = 1

let g:haskellmode_completion_ghc = 0
let g:ghcmod_use_basedir = getcwd()
setlocal omnifunc=necoghc#omnifunc
