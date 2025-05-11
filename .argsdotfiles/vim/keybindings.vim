" shortcut to save
nmap <leader>s :w<cr>

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" hitting escape will also clean highlighting
noremap <silent> <Esc> <Esc>:noh<cr>

" go to previous mark line and col
nnoremap ' `

" i hit Q by mistake.
nnoremap Q <nop>

" reload .vimrc
noremap <leader>r :so $MYVIMRC<cr>

" toggle spell check
noremap <F5> :setlocal spell! spelllang=en_us<CR>
imap  <Esc>[s1z=`]a

" set paste/nopaste toggle key
" set pastetoggle=<leader>p

nmap g. `[v`] " select inserted text

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

" edit previous file
nnoremap <leader>e :e#<CR>

" close location and quickfix window with q
autocmd BufReadPost quickfix nnoremap <buffer> q :cclose<CR>
" autocmd BufReadPost quickfix nnoremap <buffer> q :lclose<CR>

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


" change current working directory to current file and print it after changing
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

function! JumpToMiddleOfParagraph()
    let line = float2nr(round((line("'}") + line("'{")) / 2))
    execute "normal! " . line . "G"
endfunction

nnoremap T :call JumpToMiddleOfParagraph()<CR>

" fold with leader
nnoremap <silent> <leader>z za
nnoremap <silent> z<leader> za

" navigate buffers
nmap <leader>j :bnext<cr>
nmap <leader>k :bprevious<cr>

" Close current buffer and move to previous one
nmap <leader>q :bp <BAR> bd #<CR>

" visual selection for last changed or pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap - :RangerEdit<cr>
nnoremap _ :RangerSplit<cr>
nnoremap \| :RangerVSplit<cr>
noremap <Space> :
