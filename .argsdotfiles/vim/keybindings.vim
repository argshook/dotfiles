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
noremap <silent> <Esc> <Esc>:noh<cr>

" prevent entering to ex mode by hitting Q
nnoremap Q <nop>

" easier access to command line mode
nnoremap ` q:
cnoremap <silent> ` :q<cr>

" reload .vimrc
noremap <leader>r :so $MYVIMRC<cr>

" remap j k to mo in wrapped lines easily
noremap <buffer> k gk
noremap <buffer> j gj

" more goodies for wrapped line navigation
nnoremap 0 g0
nnoremap $ g$
nnoremap ^ g^

" set paste/nopaste toggle key
set pastetoggle=<leader>p

nnoremap / /\v
vnoremap / /\v

nnoremap <tab> %
vnoremap <tab> %

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

