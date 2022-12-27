function! Curl()
  execute "new"
  setlocal filetype=sh
  silent! execute "read !sh #"
endfunction

augroup curl
  autocmd!
  autocmd BufReadPost,BufNewFile *.curl nnoremap <silent> <buffer> <CR> :call Curl()<CR>
  autocmd BufReadPost,BufNewFile *.curl nnoremap Q <C-w>c
augroup END
