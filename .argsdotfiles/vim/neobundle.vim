set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" essentials
NeoBundle 'tpope/vim-fugitive'
autocmd BufReadPost fugitive://* set bufhidden=delete

NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdTree'
NeoBundle 'rking/ag.vim'

NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'christoomey/vim-tmux-navigator'

" snippets
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" language specific
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
let g:jsx_ext_required = 0

NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'elmcast/elm-vim'
let g:elm_setup_keybindings = 0

NeoBundle 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'jquery,underscore,angular,react,jasmine,chai'

" misc
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tomtom/tinykeymap_vim'
NeoBundle 'ap/vim-css-color'
NeoBundle 'benekastah/neomake'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'path_html': '~/Public/html/vimwiki/'}]

NeoBundle 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" eyecandy
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=233

NeoBundle 'gertjanreynaert/cobalt2-vim-theme'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end()

