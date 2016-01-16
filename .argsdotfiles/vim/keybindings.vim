" tab completion
imap <Tab> <C-P>

" shortcut to save
nmap <leader>s :w<cr>

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" hitting escape will also clean highlighting
noremap <Esc> <Esc>:noh<cr>

" prevent entering to ex mode
nnoremap Q <nop>

" remap j k to mo in wrapped lines easily
nnoremap <buffer> k gk
nnoremap <buffer> j gj

" more goodies for wrapped line navigation
nnoremap 0 g0
nnoremap $ g$
nnoremap ^ g^

" open unite files interface
nnoremap <Leader>f :Unite file buffer<CR>

