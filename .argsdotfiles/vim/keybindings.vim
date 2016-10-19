" tab completion
imap <Tab> <C-N>
imap <S-Tab> <C-P>

imap <expr><C-k> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><C-k> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

xmap <C-k> <Plug>(neosnippet_target)
smap <TAB> <Plug>(neosnippet_jump)

" shortcut to save
nmap <leader>s :w<cr>

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" hitting escape will also clean highlighting
noremap <silent> <Esc> <Esc>:noh<cr>

" prevent entering to ex mode by hitting Q
nnoremap Q <nop>

" easier access to command line mode
nnoremap ` q:
cnoremap <silent> ` :q<cr>

" reload .vimrc
noremap <leader>r :so $MYVIMRC<cr>

" toggle spell check
noremap <F5> :setlocal spell! spelllang=en_us<CR>

" remap j k to mo in wrapped lines easily
noremap k gk
noremap j gj

" more goodies for wrapped line navigation
nnoremap 0 g0
nnoremap $ g$
nnoremap ^ g^

" set paste/nopaste toggle key
set pastetoggle=<leader>p

nmap <tab> %
xmap <tab> %

" Zoom / Restore window.
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction

command! ZoomToggle call s:ZoomToggle()

" Zoom / Restore with ,,
nnoremap <leader><leader> :ZoomToggle<CR>

" toggle wrap
map <leader>w :set wrap!<cr>

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" display number of matches for search pattern
map ,* *<C-O>:%s///gn<CR>

" edit previous file
nnoremap <leader>e :e#<CR>

" location window, mostly to navigate linter errors
" TODO: maybe ]l and [l instead of leader?
nmap <Leader><Space>o :lopen<CR>  " open location window
nmap <Leader><Space>c :lclose<CR> " close location window
nmap ]; :ll<CR>    " go to current error/warning
nmap ]l :lnext<CR>  " next error/warning
nmap [l :lprev<CR>  " previous error/warning

" quickfix window, mostly to navigate Ag or grep results
nmap [q :cprevious<CR>
nmap ]q :cnext<CR>
nmap [Q :cfirst<CR>
nmap ]Q :clast<CR>
autocmd BufReadPost quickfix nnoremap <buffer> q :cclose<CR>

function! RenameFile()
let old_name = expand('%')
let new_name = input('New file name: ', expand('%'), 'file')
if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
endif
endfunction
map <leader>n :call RenameFile()<cr>


nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gpl :Gpull --rebase<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gremove<CR>

" change current working directory to current file and print it after changing
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

