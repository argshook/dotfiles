set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" essentials
NeoBundle 'tpope/vim-fugitive' "{{{
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>gr :Gremove<CR>
  autocmd BufReadPost fugitive://* set bufhidden=delete
"}}}

NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdTree'

NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'scrooloose/syntastic'

" language specific
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'tpope/vim-markdown'

" misc
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tomtom/tinykeymap_vim'

" eyecandy
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'gertjanreynaert/cobalt2-vim-theme'
NeoBundle 'bling/vim-airline'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

" leftovers
"NeoBundle 'mattn/emmet-vim'
"NeoBundle 'elmcast/elm-vim'
"NeoBundle 'terryma/vim-multiple-cursors'
"NeoBundle 'vimwiki/vimwiki'
"NeoBundle 'mfransen/vimwiki-todo-jabberbot'

NeoBundle 'Shougo/vimshell'

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end()
