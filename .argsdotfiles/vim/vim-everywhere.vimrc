source ~/.vimrc

autocmd FocusGained *.md call FocusGained()
autocmd FocusLost *.md call FocusLost()
autocmd Filetype *.js,*.jsx,*.ts,*.tsx,*.md setlocal textwidth=120

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

function! MegaSave()
  let date = trim(system("date +%Y-%m-%d-%H-%M-%S"))
  execute 'saveas ~/zettel/scratchpad/' . date . '.md'
  let gitAdd = system("git add ~/zettel/scratchpad/*")
  let gitCommit = system("git commit -a -m `date '+%s'`")
endfunction

nmap <leader>s :call MegaSave()<cr>
