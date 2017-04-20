imap <expr> <A-w> emmet#expandAbbrIntelligent("\<A-w>")

let g:user_emmet_install_global = 0
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  }
\}

autocmd FileType html,css,scss,javascript.jsx EmmetInstall

