autocmd BufNewFile,BufRead *.coffee setlocal shiftwidth=2 tabstop=2 expandtab
autocmd BufWritePost *.coffee silent CoffeeMake! | redraw!

map <buffer> <Leader>c :CoffeeCompile<CR>

let coffee_compile_vert = 1
