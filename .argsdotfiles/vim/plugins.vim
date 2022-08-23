call plug#begin('~/.local/share/nvim/plugged')

" =================
" essential plugins
" =================

Plug 'tpope/vim-fugitive'
autocmd BufReadPost fugitive://* set bufhidden=delete
function! s:ftplugin_fugitive() abort
  nnoremap <buffer> <silent> cc :Git commit --quiet<CR>
  nnoremap <buffer> <silent> ca :Git commit --quiet --amend<CR>
  nnoremap <buffer> <silent> ce :Git commit --quiet --amend --no-edit<CR>
endfunction
augroup nhooyr_fugitive
  autocmd!
  autocmd FileType fugitive call s:ftplugin_fugitive()
augroup END
nnoremap <silent> <leader>gs :G<cr>
autocmd User FugitiveEditor startinsert

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
Plug 'github/copilot.vim'
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

Plug 'rafaqz/ranger.vim'
let g:rg_command = 'rg --vimgrep --hidden --glob "!*-lock.json"'
let g:rg_highlight = 1
let g:rg_derive_root = 1
let g:rg_root_types = ['.git', 'package.json']
let g:rg_format = '%f:%l:%c:%m'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'tpope/vim-obsession'
Plug 'ziontee113/syntax-tree-surfer'

Plug 'tpope/vim-surround'
let g:surround_indent = 0

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

Plug 'moll/vim-node'
Plug 'nikvdp/ejs-syntax'
Plug 'mattn/emmet-vim'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
set completeopt-=preview
Plug 'lbrayner/vim-rzip'

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

Plug 'tmsvg/pear-tree'
Plug 'chrisbra/Colorizer'
let g:colorizer_use_virtual_text = 1
Plug 'junegunn/goyo.vim'
Plug 'gertjanreynaert/cobalt2-vim-theme'
Plug 'wellle/visual-split.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ggandor/lightspeed.nvim'

Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'javascript': { 'left': '//', 'leftAlt': '/**','rightAlt': '*/' } }

Plug 'yuttie/comfortable-motion.vim'

Plug 'romainl/vim-qf'

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

" initialize vimplug
call plug#end()

source ~/.argsdotfiles/vim/treesitter.lua
source ~/.argsdotfiles/vim/lightline.vim
source ~/.argsdotfiles/vim/comfortable-motion.vim
