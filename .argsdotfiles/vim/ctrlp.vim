if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif

" only show files that are not ignored by git
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_extensions = ['line']

let g:ctrlp_cmd = 'CtrlPLastMode --dir'

" this is for opening marked files as hidden buffers instead of as vertical splits
let g:ctrlp_open_multiple_files = 'ij'

nmap <leader>/ :CtrlPLine<cr>

