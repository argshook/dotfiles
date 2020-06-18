call plug#begin('~/.local/share/nvim/plugged')

" =================
" essential plugins
" =================

Plug 'tpope/vim-fugitive'
autocmd BufReadPost fugitive://* set bufhidden=delete

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'rafaqz/ranger.vim'
Plug 'jamessan/vim-gnupg'
let g:rg_command = 'rg --vimgrep'
let g:rg_highlight = 1
let g:rg_derive_root = 1
let g:rg_root_types = ['.git', 'package.json']
let g:rg_format = '%f:%l:%m'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'jreybert/vimagit'
autocmd User VimagitEnterCommit startinsert
autocmd User VimagitBufferInit setlocal foldenable
autocmd User VimagitBufferInit setlocal nocindent
autocmd User VimagitBufferInit nunmap <silent> <buffer> 0
let g:magit_show_help=0
let g:magit_default_sections = [ 'commit', 'staged', 'unstaged', 'stash', 'info', 'global_help' ]

Plug 'tpope/vim-obsession'

Plug 'tpope/vim-surround'
let g:surround_indent = 0

Plug 'vimwiki/vimwiki'
let g:vimwiki_conceallevel = 3
let g:vimwiki_list = [
  \{'path': '~/Nextcloud/vimwiki/', 'ext': '.md.gpg', 'syntax': 'markdown'},
  \{'path': '~/Nextcloud/vimwiki-work', 'ext': '.md.gpg', 'syntax': 'markdown'}
  \]

Plug 'mhinz/vim-signify'

Plug 'christoomey/vim-tmux-navigator'
" when tmux pane is zoomed, don't zoomout when navigating out of vim
let g:tmux_navigator_disable_when_zoomed = 1

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
let g:neosnippet#snippets_directory='~/.argsdotfiles/vim/snippets/'
let g:neosnippet#expand_word_boundary = 1

" =========================
" language specific plugins
" =========================

Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'css' }
Plug 'nikvdp/ejs-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
set completeopt-=preview

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plug 'leafgarland/typescript-vim'
Plug 'suan/vim-instant-markdown'
let g:instant_markdown_autostart = 0 " do npm i -g instant-markdown-d

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

" ============
" misc plugins
" ============

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsCenterLine = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsFlyMode = 1

Plug 'AndrewRadev/linediff.vim' " :LineDiff()
Plug 'lilydjwg/colorizer'
Plug 'junegunn/goyo.vim'
Plug 'gertjanreynaert/cobalt2-vim-theme'
Plug 'wellle/visual-split.vim'
Plug 'AlphaMycelium/pathfinder.vim'
Plug 'dhruvasagar/vim-table-mode'

Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'javascript': { 'left': '//', 'leftAlt': '/**','rightAlt': '*/' } }

Plug 'junegunn/limelight.vim'
let g:limelight_conceal_ctermfg = 'gray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

Plug 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_list_window_size = 5
let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \   'css': [ 'stylelint' ],
  \   'json': [ 'jq', 'fixjson' ],
  \   'html': [ 'prettier' ],
  \   'javascript': [ 'prettier', 'eslint' ],
  \   'python': [ 'autopep8' ],
  \   'haskell': [ 'hfmt' ],
  \   'typescript': [ 'prettier', 'tslint' ],
  \   'elm': [ 'elm-format' ],
  \   'rust': [ 'rustfmt' ]
  \}
let g:ale_linters = {
  \   'javascript': [ 'prettier', 'eslint' ],
  \   'python': [ 'autopep8' ],
  \   'haskell': [ 'hfmt' ],
  \   'typescript': [ 'prettier', 'eslint' ],
  \   'elm': [ 'elm-format' ]
  \}
nnoremap <leader>d :ALEDetail<cr>

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

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
\ '/': { 'pattern': '//\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] }
\ }


Plug 'itchyny/lightline.vim'

let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ }

" initialize vimplug
call plug#end()
