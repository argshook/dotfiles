source ~/.argsdotfiles/vim/neobundle.vim

let mapleader = ","

syntax enable
filetype plugin indent on

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
set showtabline=0 " disable tabline
set noshowmode
set showcmd
set clipboard+=unnamedplus
set lazyredraw
set autoread

" split to right and below
set splitbelow
set splitright

set scrolloff=3
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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/bower_components/*,*/node_modules/*  " MacOSX/Linux

set t_Co=256
set laststatus=2

let g:gitgutter_realtime=1
set updatetime=750

colorscheme cobalt2

" shorten mapping delay so that esc reacts immediately
set timeoutlen=400

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd BufRead,BufNewFile *.md,*.markdown set shiftwidth=4 softtabstop=4

source ~/.argsdotfiles/vim/airline.vim
source ~/.argsdotfiles/vim/ctrlp.vim
source ~/.argsdotfiles/vim/buffergator.vim
source ~/.argsdotfiles/vim/neosnippet.vim
source ~/.argsdotfiles/vim/nerdtree.vim
source ~/.argsdotfiles/vim/syntastic.vim
source ~/.argsdotfiles/vim/tinykeymap.vim
source ~/.argsdotfiles/vim/keybindings.vim







