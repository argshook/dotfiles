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

" set paste/nopaste toggle key
set pastetoggle=<leader>p

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

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-diagnostic-info)
inoremap <silent><expr> <c-space> coc#refresh()

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
vmap <silent> <TAB> <Plug>(coc-range-select)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" quickfix window, mostly to navigate Ag or grep results
nmap [q :cprevious<CR>
nmap ]q :cnext<CR>

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
map <leader><space> :Commands<cr>


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

nnoremap <silent> <leader>gs :execute magit#show_magit('h', 1, 1)<CR>

" jump between git hunks
nmap ]g <plug>(signify-next-hunk)
nmap [g <plug>(signify-prev-hunk)

noremap <silent> <leader>f :ALEFix<cr>

" smooth scrolling
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>

" navigate buffers
nmap <leader>j :bnext<cr>
nmap <leader>k :bprevious<cr>

" Close current buffer and move to previous one
nmap <leader>q :bp <BAR> bd #<CR>

" visual selection for last changed or pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

map <leader>l :RangerEdit<cr>
map <leader>ls :RangerSplit<cr>
map <leader>lv :RangerVSplit<cr>
map <leader>lt :RangerTab<cr>

map <leader>rn <Plug>(coc-rename)
noremap <Space> :
