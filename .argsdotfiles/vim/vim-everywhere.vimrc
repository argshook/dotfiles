source ~/.vimrc

autocmd FocusGained *.md call FocusGained()
autocmd FocusLost *.md call FocusLost()

function! FocusGained()
  normal gg0vGg_"+P

  if exists('s:cursor_pos')
    call cursor(s:cursor_pos[1], s:cursor_pos[2])
  endif
endfunction

function! FocusLost()
  let s:cursor_pos = getpos(".")
  normal gg0vGg_"+y
endfunction

nnoremap <silent> <leader>fj :set ft=javascript.jsx<CR>
nnoremap <silent> <leader>fm :set ft=markdown<CR>
