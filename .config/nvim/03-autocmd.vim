autocmd BufRead /tmp/sql* set filetype=mysql
autocmd BufRead /tmp/mutt-* set filetype=mail textwidth=72
autocmd BufRead /tmp/vimperator-* set filetype=markdown

autocmd BufNewFile,BufRead *.sls,*.raml set filetype=yaml

autocmd BufNewFile,BufRead *.hcl set filetype=conf
