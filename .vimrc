set nocompatible
set autoread

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/nerdTree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'gertjanreynaert/cobalt2-vim-theme'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'mattn/emmet-vim'


" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell'

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end()

" Required:
filetype plugin indent on

if v:version >= 703
  let mapleader = ","

  source ~/.argsdotfiles/vim/airline
  source ~/.argsdotfiles/vim/ctrlp
  source ~/.argsdotfiles/vim/buffergator
  source ~/.argsdotfiles/vim/nerdtree

  syntax enable

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

  " split to right and below
  set splitbelow
  set splitright

  " keep cursor in middle of screen
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

  set title

  " ui
  set wildmenu " enhanced comman line completion

  " move between splits with c + hjkl
  map <C-J> <C-W>j
  map <C-K> <C-W>k
  map <C-H> <C-W>h
  map <C-L> <C-W>l

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

  " prevent entering to ex mode
  nnoremap Q <nop>

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

endif
