source ~/.argsdotfiles/vim/neobundle.vim

let mapleader = ","

syntax enable
filetype plugin indent on

set nocompatible
set autoread

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set hidden
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
set shiftround
set softtabstop=2
set smartindent
set smarttab
set list listchars=tab:⟶\ ,trail:·,extends:>,precedes:<,nbsp:%
set ttyfast
set showtabline=1
set noshowmode
set showcmd
set lazyredraw
set autoread

set splitbelow " split to right and below
set splitright

set scrolloff=2
set cursorline
set previewheight=20

set undolevels=1000
set backspace=indent,eol,start

" code folding
set foldmethod=indent
set nofoldenable
set foldlevel=1

" ui
set wildmenu " enhanced command line completion
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/bower_components/*,*/node_modules/*  " MacOSX/Linux

set t_Co=256
set laststatus=2

let g:gitgutter_realtime=1
set updatetime=750

colorscheme cobalt2


" shorten mapping delay so that esc reacts immediately
set timeoutlen=400

" stop syntax highlighting after 400 chars.
" This makes scrolling files with super long lines way faster.
set synmaxcol=300

" set scrolloff if the buffer is readonly (so mostly help files)
autocmd BufEnter * if &readonly | set so=999 | endif
autocmd BufLeave * if &readonly | set so=2 | endif

autocmd Filetype gitcommit,markdown,vimwiki setlocal textwidth=72
autocmd Filetype help setlocal scrolloff=999

autocmd BufRead,BufNewFile *.md,*.markdown set shiftwidth=4 softtabstop=4
autocmd BufRead,BufNewFile *.css set filetype=scss
autocmd BufRead,BufNewFile *.elm set shiftwidth=2

autocmd VimEnter * cd %:p:h

source ~/.argsdotfiles/vim/airline.vim
source ~/.argsdotfiles/vim/ctrlp.vim
source ~/.argsdotfiles/vim/neosnippet.vim
source ~/.argsdotfiles/vim/neomake.vim
source ~/.argsdotfiles/vim/nerdtree.vim
source ~/.argsdotfiles/vim/tinykeymap.vim
source ~/.argsdotfiles/vim/emmet.vim
source ~/.argsdotfiles/vim/keybindings.vim

