let mapleader = ","
source ~/.argsdotfiles/vim/neobundle.vim
source ~/.argsdotfiles/vim/airline.vim
source ~/.argsdotfiles/vim/ctrlp.vim
source ~/.argsdotfiles/vim/buffergator.vim
source ~/.argsdotfiles/vim/nerdtree.vim
source ~/.argsdotfiles/vim/syntastic.vim
source ~/.argsdotfiles/vim/tinykeymap.vim

filetype plugin indent on
syntax enable

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
set hlsearch
set visualbell
set t_vb=
set mouse=a
set title
set undofile

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
set colorcolumn=100

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

" ui
set wildmenu " enhanced comman line completion

set t_Co=256
set laststatus=2

let g:gitgutter_realtime=1
set updatetime=750

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/bower_components/*,*/node_modules/*  " MacOSX/Linux

colorscheme cobalt2

source ~/.argsdotfiles/vim/keybindings.vim

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

