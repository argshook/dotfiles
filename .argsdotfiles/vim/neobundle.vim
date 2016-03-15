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
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdTree'
NeoBundle 'rking/ag.vim'

NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'scrooloose/syntastic'

" snippets
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" language specific
NeoBundle 'pangloss/vim-javascript'
"NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'elmcast/elm-vim'
"NeoBundle 'ternjs/tern_for_vim' " run `npm i` in `~/.vim/bundle/tern_for_vim/`

" misc
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tomtom/tinykeymap_vim'
NeoBundle 'ap/vim-css-color'
"NeoBundle 'gabrielelana/vim-markdown'
"NeoBundle 'godlygeek/tabular'

" eyecandy
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'gertjanreynaert/cobalt2-vim-theme'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

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
"NeoBundle 'terryma/vim-multiple-cursors'
"NeoBundle 'vimwiki/vimwiki'
"NeoBundle 'mfransen/vimwiki-todo-jabberbot'
"NeoBundle 'Shougo/unite.vim'

NeoBundle 'Shougo/vimshell'

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end()

