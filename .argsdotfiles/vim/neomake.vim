let g:neomake_javascript_enabled_makers = ['eslint']

autocmd! BufWritePost,BufEnter * Neomake
