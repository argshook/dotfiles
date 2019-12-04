call plug#begin('~/.local/share/nvim/plugged')

" essentials
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
autocmd BufReadPost fugitive://* set bufhidden=delete
Plug 'tpope/vim-rhubarb'
Plug 'jreybert/vimagit'

Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
let g:surround_indent = 0
Plug 'tpope/vim-repeat'
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
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
set completeopt-=preview

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plug 'leafgarland/typescript-vim'
Plug 'suan/vim-instant-markdown'
let g:instant_markdown_autostart = 0 " do npm i -g instant-markdown-d

Plug 'cakebaker/scss-syntax.vim', { 'for': 'css' }
Plug 'elmcast/elm-vim', { 'for': 'elm'  }
let g:elm_make_show_warnings = 1
let g:elm_setup_keybindings = 0
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
autocmd FileType elm nmap <leader>m <Plug>(elm-make)
autocmd FileType elm nmap <leader>M <Plug>(elm-make-main)
autocmd FileType elm nmap <leader>d <Plug>(elm-error-detail)
autocmd BufWritePost *.elm ElmMake

Plug 'nikvdp/ejs-syntax'

" misc
Plug 'jiangmiao/auto-pairs'
Plug 'rr-/vim-hexdec'
let g:AutoPairsCenterLine = 0
let g:AutoPairsMultilineClose = 0
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'javascript': { 'left': '//', 'leftAlt': '/**','rightAlt': '*/' } }
" Plug 'junegunn/vim-peekaboo' " there's a bug with register name being insterted in active buffer
Plug 'deathlyfrantic/vim-peekaboo', { 'branch': 'patch-1' }
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
  \   'css': [ 'stylelint' ],
  \   'json': [ 'jq', 'fixjson' ],
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
Plug 'yuttie/comfortable-motion.vim'
let g:comfortable_motion_interval = 1000.0 / 60.0
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 8.0
Plug 'itchyny/vim-qfedit'
let g:editqf_jump_to_error = 0
Plug 'simnalamburt/vim-mundo'
nnoremap <F6> :MundoToggle<CR>
let g:mundo_prefer_python3 = 1
let g:mundo_auto_preview = 0
let g:mundo_return_on_revert = 0

Plug 'jamessan/vim-gnupg'

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
\ '/': { 'pattern': '//\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] }
\ }

Plug 'gertjanreynaert/cobalt2-vim-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()
