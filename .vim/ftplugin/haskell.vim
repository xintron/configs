" ghc-mod
nmap <silent> <Space>ht :GhcModType!<CR>
nmap <silent> <Space>hc :GhcModTypeClear<CR>
nmap <silent> <Space>hi :GhcModInfo<CR>

let g:haskell_enable_pattern_synonyms = 1

setlocal omnifunc=necoghc#omnifunc
