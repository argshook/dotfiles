set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" essentials
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdTree'

NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/syntastic'

" language specific
NeoBundle 'pangloss/vim-javascript', {
      \ 'lazy' : 1,
      \ 'autoload': {
      \    'filetypes': ['js', 'jsx', 'es6']
      \  }
      \}

NeoBundle 'jelera/vim-javascript-syntax', {
      \ 'lazy' : 1,
      \ 'autoload': {
      \    'filetypes': ['js', 'jsx', 'es6']
      \  }
      \}

NeoBundle 'cakebaker/scss-syntax.vim', {
      \ 'lazy' : 1,
      \ 'autoload': {
      \    'filetypes': ['sass', 'scss']
      \  }
      \}


" misc
NeoBundle 'vimwiki/vimwiki'
NeoBundle 'mfransen/vimwiki-todo-jabberbot'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'scrooloose/nerdcommenter'

" eyecandy
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'gertjanreynaert/cobalt2-vim-theme'

" leftovers
"NeoBundle 'mattn/emmet-vim'
"NeoBundle 'elmcast/elm-vim'
"NeoBundle 'terryma/vim-multiple-cursors'

NeoBundle 'Shougo/vimshell'

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end()

