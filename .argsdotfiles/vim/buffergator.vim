" Open a new empty buffer
nmap <leader>T :enew<cr>

" Go to the next buffer open
nmap <leader>k :BuffergatorMruCycleNext<cr>

" Go to the previous buffer open
nmap <leader>j :BuffergatorMruCyclePrev<cr>

" Close the current buffer and move to the previous one
nmap <leader>q :bp <BAR> bd #<CR>

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'B'
let g:buffergator_hsplit_size = 5
let g:buffergator_sort_regime = 'mru'
let g:buffergator_show_full_directory_path = 0
let g:buffergator_autoexpand_on_split = 0

