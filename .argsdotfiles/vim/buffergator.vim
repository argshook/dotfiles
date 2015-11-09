" Open a new empty buffer
nmap <leader>T :enew<cr>

" Go to the next buffer open
nmap <leader>k :BuffergatorMruCycleNext<cr>

" Go to the previous buffer open
nmap <leader>j :BuffergatorMruCyclePrev<cr>

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>


" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

