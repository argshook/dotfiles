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


" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell'

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end()

" allow hidden buffers
set hidden

source .argsdotfiles/vim/airline
source .argsdotfiles/vim/ctrlp

" Required:
filetype plugin indent on

if v:version >= 703
  syntax enable
  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
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
  set scrolloff=999
  set cursorline

  set ruler
  set undolevels=1000
  set backspace=indent,eol,start

  " code folding
  set foldmethod=indent
  set nofoldenable
  set foldlevel=1

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

  let mapleader = ","

  " shortcut to save
  nmap <leader>s :w<cr>

  colorscheme cobalt2

  " open nerdree with ,k
  nmap <leader>k :NERDTreeToggle<cr>
  " show hidden files in NERDTree
  let NERDTreeShowHidden=1
  " remove some files by extension
  let NERDTreeIgnore = ['\.js.map$', '.git', 'node_modules', 'bower_components', '.sass-cache', '.tmp']
  " close nerdtree when file was opened
  let g:NERDTreeQuitOnOpen=1
  " open in new tab by default
  let NERDTreeMapOpenInTab='<ENTER>'
  " expand to the path of the file in the current buffer
  nmap <silent> <leader>y :NERDTreeFind<cr>
  let NERDTreeMinimalUI=1
  let NERDTreeDirArrows=1

  " prevent entering to ex mode
  nnoremap Q <nop>

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
