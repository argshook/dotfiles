source ~/.config/nvim/init.vim

function! MegaSave()
  write
  let gitAdd = system("cd ~/zettel && git add .")
  let gitCommit = system("cd ~/zettel && git commit -a -m `date '+%s'`")
endfunction

nmap <leader>s :call MegaSave()<cr>
imap <c-k> <Esc>:call g:FzfSearchDigraphs()<cr>

function! PlayYoutube()
  let line=getline('.')
  let cmd="radio youtube '" . line ."'"
  botright new
  call termopen(cmd, {"detach": 0})
endfunction
nmap <leader>m :call PlayYoutube()<cr>
" tnoremap <Esc> <C-\><C-n>

function! DirifyNote()
  " use this when a note grows into a topic.
  " move some-note.md to some-note/index.md
  let filename = expand('%:p')
  let dirname = expand('%:p:r')
  let movedFilename = dirname."/index.md"
  let mkdir = system("mkdir ".dirname)
  let mv = system("mv ".filename." ".movedFilename )
  execute "edit " . movedFilename
endfunction
command! DirifyNote call DirifyNote()
