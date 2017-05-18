" hey, you need to split this up

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" essentials
NeoBundle 'tpope/vim-fugitive'
autocmd BufReadPost fugitive://* set bufhidden=delete
NeoBundle 'tpope/vim-rhubarb'
NeoBundle 'jreybert/vimagit', 'dev/issue_123'

NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-surround'
let g:surround_indent = 0
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'wellle/targets.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdTree'
NeoBundle 'rking/ag.vim'

NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'airblade/vim-gitgutter'
let g:gitgutter_diff_args = '-w'
NeoBundle 'christoomey/vim-tmux-navigator'

" snippets
NeoBundle 'Shougo/deoplete.nvim'
let g:deoplete#file#enable_buffer_path = 1
NeoBundle 'davidhalter/jedi'
NeoBundle 'zchee/deoplete-jedi'
let g:deoplete#sources#jedi#show_docstring = 1

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" language specific
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
let g:jsx_ext_required = 0
NeoBundle 'ternjs/tern_for_vim'
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
NeoBundle 'nvie/vim-flake8'
autocmd BufWritePost *.py call Flake8()

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
let g:vimwiki_list = [
  \{'path': '~/Dropbox/vimwiki/', 'path_html': '~/Public/html/vimwiki/'},
  \{'path': '~/Dropbox/vimwiki-fed-guild', 'path_html': '~/Public/html/vimwiki-fed-guild'}
  \]

NeoBundle 'sbdchd/neoformat'
let g:neoformat_only_msg_on_error = 1
let g:neoformat_enabled_javascript = ['prettier', 'eslint']
let g:neoformat_javascript_prettier = {
  \ 'exe': 'prettier',
  \ 'args': ['--stdin', '--single-quote'],
  \ 'stdin': 1,
  \ }

NeoBundle 'jamessan/vim-gnupg'
NeoBundle 'geekjuice/vim-mocha'
let g:mocha_js_command = "!mocha --recursive --reporter list --compilers js:./node_modules/babel-core/register {spec}"

NeoBundle 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
\ '/': { 'pattern': '//\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] }
\ }

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
NeoBundle 'junegunn/limelight.vim'
let g:limelight_conceal_ctermfg = 'gray'

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end()

