if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif

" only show files that are not ignored by git
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_extensions = ['line']

let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_line_prefix = '  '
let g:ctrlp_types = ['fil', 'buf', 'mru']

" this is for opening marked files as hidden buffers instead of as vertical splits
let g:ctrlp_open_multiple_files = 'ij'

nmap <leader>/ :CtrlPLine<cr>
nmap <leader>b :CtrlPBuffer<cr>

" Go to the next buffer
nmap <leader>j :bnext<cr>

" Go to the previous buffer open
nmap <leader>k :bprevious<cr>

" Close the current buffer and move to the previous one
nmap <leader>q :bp <BAR> bd #<CR>

let g:ctrlp_buffer_func = { 'enter': 'CtrlPMappings' }

function! CtrlPMappings()
  nnoremap <buffer> <silent> <C-x> :call <sid>DeleteBuffer()<cr>
endfunction

function! s:DeleteBuffer()
  let path = fnamemodify(getline('.')[2:], ':p')
  let bufn = matchstr(path, '\v\d+\ze\*No Name')
  exec "bd" bufn ==# "" ? path : bufn
  exec "norm \<F5>"
endfunction


