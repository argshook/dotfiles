source ~/.config/nvim/init.vim

function! MegaSave()
  write
  let gitAdd = system("cd ~/zettel && git add .")
  let gitCommit = system("cd ~/zettel && git commit -a -m `date '+%s'`")
endfunction

nmap <leader>s :call MegaSave()<cr>
iunmap <c-k>

function! PlayYoutube()
  let line=getline('.')
  let cmd="radio youtube '" . line ."'"
  botright new
  call termopen(cmd, {"detach": 0})
endfunction
nmap <leader>m :call PlayYoutube()<cr>
" tnoremap <Esc> <C-\><C-n>
