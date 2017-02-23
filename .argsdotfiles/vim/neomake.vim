" just verbose it to figure out why it doesn't work
" cause it frequently stops working
"let g:neomake_verbose = 3

let g:neomake_javascript_enabled_makers = ['eslint']

" the path is good, relax, you really shouldn't tweak it anymore
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

autocmd! BufWritePost,BufEnter * Neomake

