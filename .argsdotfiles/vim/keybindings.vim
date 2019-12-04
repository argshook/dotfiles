imap <expr><C-k> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><C-k> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


xmap <C-k> <Plug>(neosnippet_target)
imap <Tab> <C-n>
imap <S-Tab> <C-p>

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

" remap j k to move in wrapped lines easily
" noremap k gk
" noremap j gj

" more goodies for wrapped line navigation
" nnoremap 0 g0
" nnoremap $ g$
" nnoremap ^ g^

" set paste/nopaste toggle key
set pastetoggle=<leader>p

nmap <tab> %
xmap <tab> %

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

" display number of matches for search pattern
map ,* *<C-O>:%s///gn<CR>

" edit previous file
nnoremap <leader>e :e#<CR>

" location window, mostly to navigate linter errors
nmap <Leader><Space>o :lopen<CR>  " open location window
nmap <Leader><Space>c :lclose<CR> " close location window

nmap ]l <Plug>(coc-diagnostic-next)
nmap [l <Plug>(coc-diagnostic-prev)
call coc#config('coc.preferences', {
  \ 'triggerSignatureHelp': 'false',
  \})

nmap <silent> \d :ALEDetail<CR>
nmap <silent> \f <Plug>(coc-fix-current)

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ge <Plug>(coc-diagnostic-info)
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>


" quickfix window, mostly to navigate Ag or grep results
nmap [q :cprevious<CR>
nmap ]q :cnext<CR>
nmap [Q :cfirst<CR>
nmap ]Q :clast<CR>

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


" fugitive & Magit
"nnoremap <silent> <leader>gs :Gstatus<CR><C-w>20+
nnoremap <silent> <leader>gs :execute magit#show_magit('h', 1, 1)<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gpl :Gpull --rebase<CR>

" change current working directory to current file and print it after changing
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

function! JumpToMiddleOfParagraph()
    let line = float2nr(round((line("'}") + line("'{")) / 2))
    execute "normal! " . line . "G"
endfunction

nnoremap T :call JumpToMiddleOfParagraph()<CR>

" print date for fun
inoremap <F4> <C-R>=strftime("%H:%M:%S")<CR>
inoremap <F5> <C-R>=strftime("%Y-%m-%d %A")<CR>

" fold with leader
nnoremap <silent> <leader>z za
nnoremap <silent> z<leader> za

" numbers with alt (meta) key hahah
inoremap <silent> <M-a> 1
noremap <silent> <M-a> 1
inoremap <silent> <M-s> 2
noremap <silent> <M-s> 2
inoremap <silent> <M-d> 3
noremap <silent> <M-d> 3
inoremap <silent> <M-f> 4
noremap <silent> <M-f> 4
inoremap <silent> <M-g> 5
noremap <silent> <M-g> 5
inoremap <silent> <M-h> 6
noremap <silent> <M-h> 6
inoremap <silent> <M-j> 7
noremap <silent> <M-j> 7
inoremap <silent> <M-k> 8
noremap <silent> <M-k> 8
inoremap <silent> <M-l> 9
noremap <silent> <M-l> 9
inoremap <silent> <M-;> 0
noremap <silent> <M-;> 0

" jump between git hunks
nmap ]g <plug>(signify-next-hunk)
nmap [g <plug>(signify-prev-hunk)

map <Leader>T :call RunCurrentSpecFile()<CR>
map <Leader>t :call RunNearestSpec()<CR>
map <Leader>u :call RunLastSpec()<CR>

nnoremap <F9> :exec '!python3' @%<cr>

noremap <silent> <leader>f :ALEFix<cr>

" smooth scrolling
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Go to the next buffer
nmap <leader>j :bnext<cr>

" Go to the previous buffer open
nmap <leader>k :bprevious<cr>

" Close the current buffer and move to the previous one
nmap <leader>q :bp <BAR> bd #<CR>

" visual selection for last changed or pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" drag visually selected blocks, for fun
" vmap  <expr>  H DVB_Drag('left')
" vmap  <expr>  L DVB_Drag('right')
" vmap  <expr>  J DVB_Drag('down')
" vmap  <expr>  K DVB_Drag('up')

map <leader>l :RangerEdit<cr>
map <leader>ls :RangerSplit<cr>
map <leader>lv :RangerVSplit<cr>
map <leader>lt :RangerTab<cr>

map <leader>rn <Plug>(coc-rename)
