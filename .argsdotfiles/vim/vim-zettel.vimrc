source ~/.vimrc

nmap <C-P> :FZF<cr>

function! MegaSave()
  write
  let gitAdd = system("git add .")
  let gitCommit = system("git commit -a -m `date '+%s'`")
endfunction

nmap <leader>s :call MegaSave()<cr>
