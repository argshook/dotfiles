if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif

" only show files that are not ignored by git
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_extensions = ['line']

nmap <leader>/ :CtrlPLine<cr>

