if has('vim_starting')
  if &compatible
    set nocompatible  " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/argshook/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/argshook/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

if v:version >= 703
  set dir=~/tmp
  set number
  set linebreak
  set textwidth=100
  set showmatch
  set visualbell

  set hlsearch
  set smartcase
  set ignorecase
  set incsearch

  set autoindent
  set cindent
  set expandtab
  set shiftwidth=2
  set smartindent
  set smarttab
  set softtabstop=2


  set ruler

  set undolevels=1000
  set backspace=indent,eol,start

  autocmd Filetype gitcommit setlocal spell textwidth=72
endif
