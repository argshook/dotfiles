source ~/.config/nvim/init.vim

autocmd FocusGained *.md call FocusGained()
autocmd FocusLost *.md call FocusLost()
autocmd Filetype *.js,*.jsx,*.ts,*.tsx,*.md setlocal textwidth=120

imap <c-k> <Esc>:call g:FzfSearchDigraphs()<cr>

function! FocusGained()
  normal ggVG"+P

  if exists('s:cursor_pos')
    call cursor(s:cursor_pos[1], s:cursor_pos[2])
  endif
endfunction

function! FocusLost()
  let s:cursor_pos = getpos(".")
  normal ggVG"+y
endfunction

nnoremap <silent> <leader>fj :set ft=javascript.jsx<CR>
nnoremap <silent> <leader>fm :set ft=markdown<CR>

function! MegaSave()
  let date = trim(system("date +%Y-%m-%d-%H-%M-%S"))
  execute 'saveas ~/zettel/scratchpad/' . date . '.md'
  let gitAdd = system("cd ~/zettel && git add ~/zettel/scratchpad/*")
  let gitCommit = system("cd ~/zettel && git commit -a -m `date '+%s'`")
endfunction

nmap <leader>s :call MegaSave()<cr>
