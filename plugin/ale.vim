let g:ale_lint_on_enter=1
let g:ale_set_highlights=1
let g:ale_fix_on_save=1
let g:airline#extensions#ale#enabled=1
let g:ale_fixers = {
\    'go': [
\       'gofmt'
\    ],
\   'javascript': [
\       'DoSomething',
\       'eslint',
\       {buffer, lines -> filter(lines, 'v:val !=~ ''^\s*//''')},
\   ],
\}

