function! Curl()
  execute "vnew"
  setlocal filetype=sh
  silent! execute "read !sh #"
endfunction

augroup curl
  autocmd!
  autocmd! BufReadPost,BufNewFile *.curl nnoremap <silent> <buffer> <CR> :call Curl()<CR>
augroup END
