if exists("b:did_user_ftplugin") | finish | endif

" ghc-mod
nmap <silent> <Space>ht :GhcModType!<CR>
nmap <silent> <Space>hc :GhcModTypeClear<CR>
nmap <silent> <Space>hi :GhcModInfo<CR>

let b:did_user_ftplugin = 1
