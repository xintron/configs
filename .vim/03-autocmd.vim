autocmd BufRead /tmp/sql* set filetype=mysql
autocmd BufRead /tmp/mutt-* set filetype=mail textwidth=72
autocmd BufRead /tmp/vimperator-* set filetype=markdown

autocmd BufRead *.sls set filetype=yaml

"autocmd BufReadPost *.py if getline(1) =~ 'python2' | let g:syntastic_python_flake8_exe="flake8-python2" | endif
