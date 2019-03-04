call plug#begin('~/.local/share/nvim/plugged')

" essentials
Plug 'tpope/vim-fugitive'
autocmd BufReadPost fugitive://* set bufhidden=delete
Plug 'tpope/vim-rhubarb'
Plug 'jreybert/vimagit'

Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
let g:surround_indent = 0
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'wellle/targets.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'rafaqz/ranger.vim'

Plug 'mhinz/vim-signify', {'build': {'unix': 'npm install'}}
let g:signify_realtime = 0 " this doesnt work something somewhere sets it to 1 wtf
Plug 'christoomey/vim-tmux-navigator'
" when tmux pane is zoomed, don't zoomout when navigating out of vim
let g:tmux_navigator_disable_when_zoomed = 1

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" language specific
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
set completeopt-=preview

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plug 'leafgarland/typescript-vim'
Plug 'suan/vim-instant-markdown'
let g:instant_markdown_autostart = 0 " do npm i -g instant-markdown-d
Plug 'reasonml-editor/vim-reason-plus'

Plug 'cakebaker/scss-syntax.vim'
Plug 'elmcast/elm-vim'
let g:elm_make_show_warnings = 1
let g:elm_setup_keybindings = 0
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
autocmd FileType elm nmap <leader>m <Plug>(elm-make)
autocmd FileType elm nmap <leader>M <Plug>(elm-make-main)
autocmd FileType elm nmap <leader>d <Plug>(elm-error-detail)
autocmd BufWritePost *.elm ElmMake

Plug 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'jquery,underscore,angular,react,jasmine,chai'

" misc
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsCenterLine = 0
let g:AutoPairsMultilineClose = 0
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'javascript': { 'left': '//', 'leftAlt': '/**','rightAlt': '*/' } }
Plug 'junegunn/vim-peekaboo'
Plug 'AndrewRadev/linediff.vim' " :LineDiff()

Plug 'gko/vim-coloresque'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
let g:limelight_conceal_ctermfg = 'gray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_list_window_size = 5
let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \   'json': [ 'jq' ],
  \   'javascript': [ 'prettier', 'eslint' ],
  \   'python': [ 'autopep8' ],
  \   'haskell': [ 'hfmt' ],
  \   'typescript': [ 'prettier', 'tslint' ],
  \   'elm': [ 'elm-format' ]
  \}
let g:ale_linters = {
  \   'javascript': [ 'prettier', 'eslint' ],
  \   'python': [ 'autopep8' ],
  \   'haskell': [ 'hfmt' ],
  \   'typescript': [ 'prettier', 'tslint' ],
  \   'elm': [ 'elm-format' ]
  \}
nnoremap <leader>d :ALEDetail<cr>
Plug 'wellle/visual-split.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'jceb/vim-editqf'
let g:editqf_jump_to_error = 0
Plug 'simnalamburt/vim-mundo'
nnoremap <F6> :MundoToggle<CR>
let g:mundo_prefer_python3 = 1
let g:mundo_auto_preview = 0
let g:mundo_return_on_revert = 0


Plug 'jamessan/vim-gnupg'
Plug 'geekjuice/vim-mocha'
let g:mocha_js_command = "!mocha --recursive --reporter list --compilers js:./node_modules/babel-core/register {spec}"

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
\ '/': { 'pattern': '//\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] }
\ }

" eyecandy
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=233
Plug 'RRethy/vim-illuminate'

Plug 'gertjanreynaert/cobalt2-vim-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'thiagoalessio/rainbow_levels.vim'
let g:rainbow_levels = [
    \{'ctermfg': 2, 'guifg': '#859900'},
    \{'ctermfg': 6, 'guifg': '#2aa198'},
    \{'ctermfg': 4, 'guifg': '#268bd2'},
    \{'ctermfg': 5, 'guifg': '#6c71c4'},
    \{'ctermfg': 1, 'guifg': '#dc322f'},
    \{'ctermfg': 3, 'guifg': '#b58900'},
    \{'ctermfg': 8, 'guifg': '#839496'},
    \{'ctermfg': 7, 'guifg': '#586e75'}]

" Initialize plugin system
call plug#end()
