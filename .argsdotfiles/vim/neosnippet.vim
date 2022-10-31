let g:deoplete#enable_at_startup = 1
let g:neosnippet#snippets_directory='~/.argsdotfiles/vim/snippets/'
let g:neosnippet#expand_word_boundary = 1

imap <expr><C-k> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><C-k> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
xmap <C-k> <Plug>(neosnippet_target)
