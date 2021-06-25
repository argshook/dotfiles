nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-diagnostic-info)
map <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#refresh()

nmap ]l <Plug>(coc-diagnostic-next)
nmap [l <Plug>(coc-diagnostic-prev)
call coc#config('coc.preferences', {
  \ 'triggerSignatureHelp': 'false',
  \})

nmap <silent> \f <Plug>(coc-fix-current)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" nmap <silent> gi <Plug>(coc-diagnostic-info)
inoremap <silent><expr> <c-space> coc#refresh()

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
vmap <silent> <TAB> <Plug>(coc-range-select)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


