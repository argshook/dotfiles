set runtimepath^=~/.vim
let &packpath = &runtimepath

let os = system("uname | awk '$1'")
if os =~ 'Linux'
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/bin/python3'
elseif os =~ 'Darwin'
  let g:python_host_prog = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

let mapleader = ","

syntax enable

set autoread
set backupdir=~/.tmp/vim
set backupcopy=yes
set directory=~/.tmp/vim
set number
set modeline
set linebreak
set textwidth=120
set showmatch
set hlsearch
set visualbell
set t_vb=
set mouse=a
set undofile
set smartcase
set ignorecase
set incsearch
if has("nvim")
  set inccommand=split
endif
set autoindent
set cindent
set expandtab
set shiftwidth=2
set shiftround
set softtabstop=2
set smartindent
set smarttab
set list listchars=tab:⟶\ ,trail:·,extends:>,precedes:<,nbsp:%
set showtabline=1
set noshowmode
set showcmd
set lazyredraw
set conceallevel=0
set splitbelow
set splitright
set scrolloff=2
set previewheight=20
set undolevels=1000
set backspace=indent,eol,start
set foldmethod=indent
set foldlevelstart=3
set laststatus=2
set signcolumn=yes
set iskeyword+=-
set fillchars+=eob:\ " theres a whitespace at the end
set updatetime=300

" shorten mapping delay so that esc reacts immediately
set timeoutlen=400

" stop syntax highlighting after 400 chars.
" This makes scrolling files with long lines way faster.
set synmaxcol=1000

source ~/.argsdotfiles/vim/plugins.vim

colorscheme cobalt2
highlight SignColumn ctermbg=NONE

autocmd BufEnter *.js set shiftwidth=2
" set scrolloff if the buffer is readonly (so mostly help files)
autocmd VimEnter,WinEnter,BufWinEnter */doc/*.txt set scrolloff=999
autocmd BufLeave,WinLeave */doc/*.txt set scrolloff=2

autocmd Filetype gitcommit,magit,markdown setlocal textwidth=72
autocmd Filetype ejs setlocal filetype=javascript.ejs
autocmd BufRead,BufNewFile *.css set filetype=scss

autocmd TermOpen * startinsert

source ~/.argsdotfiles/vim/keybindings.vim
source ~/.argsdotfiles/vim/abbreviations.vim
source ~/.argsdotfiles/vim/fzf.vim
source ~/.argsdotfiles/vim/coc.vim
source ~/.argsdotfiles/vim/grep.vim

let $PATH.='node_modules'
