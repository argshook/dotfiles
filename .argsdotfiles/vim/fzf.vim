let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '15%' }


" Customize fzf colors to match your color scheme
let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nmap <C-P> :History<cr>
nmap <leader>/ :Lines<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>h :GitFiles --cached --others --exclude-standard<cr>
nmap <leader>H :Helptags<cr>
nmap <leader>m :Marks<cr>
