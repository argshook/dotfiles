source ~/.vimrc

autocmd FocusGained *.md call FocusGained()
autocmd FocusLost *.md call FocusLost()

function! FocusGained()
  normal ggVG"+P

  if exists('s:cursor_pos')
    call cursor(s:cursor_pos[1], s:cursor_pos[2])
  endif
endfunction

function! FocusLost()
  let s:cursor_pos = getpos(".")
  normal ggvGg_"+y
endfunction
