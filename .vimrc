set nocompatible
set autoread

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdTree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'



" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

if v:version >= 703
  syntax enable
  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set number
  set linebreak
  set textwidth=120
  set showmatch
  set visualbell

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


  set ruler
  set undolevels=1000
  set backspace=indent,eol,start

  " code folding
  set foldmethod=syntax
  set nofoldenable
  set foldlevel=1
  set title

  " ui
  set wildmenu " enhanced comman line completion

  " shortcut to save
  nmap <leader>, :w<cr>

  " airline options
  let g:airline_powerline_fonts=1
  let g:airline_left_sep=''
  let g:airline_right_sep=''
  let g:airline_theme='solarized'
  set t_Co=256
  set laststatus=2


  if exists("g:ctrl_user_command")
    unlet g:ctrlp_user_command
  endif
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/bower_components/*,*/node_modules/*  " MacOSX/Linux

  " only show files that are not ignored by git
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

  let mapleader = ","
  " set background = "dark"
  colorscheme solarized

  " open nerdree with ,ne
  nmap <leader>k :NERDTree<cr>
  " show hidden files in NERDTree
  let NERDTreeShowHidden=1
  " remove some files by extension
  let NERDTreeIgnore = ['\.js.map$', '.git']
  " close nerdtree when file was opened
  let g:NERDTreeQuitOnOpen=0
  " open in new tab by default
  let NERDTreeMapOpenInTab='<ENTER>'
  " expand to the path of the file in the current buffer
  nmap <silent> <leader>y :NERDTreeFind<cr>


  autocmd Filetype gitcommit setlocal spell textwidth=72

endif
