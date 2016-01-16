source ~/.argsdotfiles/vim/neobundle.vim
source ~/.argsdotfiles/vim/airline.vim
source ~/.argsdotfiles/vim/ctrlp.vim
source ~/.argsdotfiles/vim/buffergator.vim
source ~/.argsdotfiles/vim/nerdtree.vim
source ~/.argsdotfiles/vim/syntastic.vim

filetype plugin indent on
syntax enable
let mapleader = ","

set nocompatible
set autoread

" allow hidden buffers
set hidden

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set relativenumber
set number
set linebreak
set textwidth=120
set showmatch
set visualbell
set t_vb=
set mouse=a
set title

set smartcase
set ignorecase
set incsearch

set autoindent
set cindent
set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent
set smarttab
set list listchars=tab:⟶\ ,trail:·,extends:>,precedes:<,nbsp:%
set ttyfast
set lazyredraw

" split to right and below
set splitbelow
set splitright

set scrolloff=5
set cursorline

set ruler
set undolevels=1000
set backspace=indent,eol,start

" code folding
set foldmethod=indent
set nofoldenable
set foldlevel=1

" emmet config
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss EmmetInstall

" ui
set wildmenu " enhanced comman line completion

set t_Co=256
set laststatus=2

let g:gitgutter_realtime=1
set updatetime=750

" tab completion
imap <Tab> <C-P>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/bower_components/*,*/node_modules/*  " MacOSX/Linux

" shortcut to save
nmap <leader>s :w<cr>

colorscheme cobalt2

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

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

" shorten mapping delay so that esc reacts immediately
set timeoutlen=200 ttimeoutlen=0

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

autocmd Filetype gitcommit setlocal spell textwidth=72

