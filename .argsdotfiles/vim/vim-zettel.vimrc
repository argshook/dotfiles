call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'rafaqz/ranger.vim'
Plug 'plasticboy/vim-markdown'
Plug 'gertjanreynaert/cobalt2-vim-theme'
Plug 'yuttie/comfortable-motion.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'sedm0784/vim-you-autocorrect'
Plug 'reedes/vim-pencil'
Plug 'suan/vim-instant-markdown'
let g:instant_markdown_autostart = 0 " do npm i -g instant-markdown-d
Plug 'dkarter/bullets.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'lervag/vimtex'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'romainl/vim-qf'

call plug#end()

let mapleader = ","
set number
set ignorecase
set smartcase
set conceallevel=2
set splitbelow
set splitright
colorscheme cobalt2
let g:surround_indent = 0

source ~/.argsdotfiles/vim/treesitter.lua
source ~/.argsdotfiles/vim/fzf.vim
source ~/.argsdotfiles/vim/lightline.vim
source ~/.argsdotfiles/vim/comfortable-motion.vim
source ~/.argsdotfiles/vim/abbreviations.vim
source ~/.argsdotfiles/vim/grep.vim
source ~/.argsdotfiles/vim/prettify.vim

let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_level = 6
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_toc_autofit = 1

" set scrolloff if the buffer is readonly (so mostly help files)
autocmd VimEnter,WinEnter,BufWinEnter */doc/*.txt set scrolloff=999
autocmd BufLeave,WinLeave */doc/*.txt set scrolloff=2

noremap <silent> <Esc> <Esc>:noh<cr>

function! MegaSave()
  write

  let home = getenv("HOME")
  let zettel = getenv("ZETTEL")
  let is_public = stridx(expand('%:p'), home . "/zettel-public") != -1
  if is_public
    let cwd = home . "/zettel-public"
  else
    let cwd = zettel
  endif

  call jobstart("git add . && git commit -a -m `date '+%s'`", { "cwd": cwd })
endfunction

nmap <leader>s :call MegaSave()<cr>
imap <c-k> <Esc>:call g:FzfSearchDigraphs()<cr>

function! PlayYoutube()
  let line=getline('.')
  let cmd="radio youtube '" . line ."'"
  botright new
  call termopen(cmd, {"detach": 0})
endfunction
nmap <leader>m :call PlayYoutube()<cr>

function! DirifyNote()
  " use this when a note grows into a topic.
  " move some-note.md to some-note/index.md
  let filename = expand('%:p')
  let dirname = expand('%:p:r')
  let movedFilename = dirname."/index.md"
  let mkdir = system("mkdir ".dirname)
  let mv = system("mv ".filename." ".movedFilename )
  execute "edit " . movedFilename
endfunction
command! DirifyNote call DirifyNote()

function! EditZettelIndex()
  let zettel = getenv("ZETTEL")
  execute "edit " . zettel . "/index.md"
endfunction

command! ZettelIndex call EditZettelIndex()
nnoremap <silent> <leader>ww :ZettelIndex<cr>

nnoremap - :RangerEdit<cr>
nnoremap _ :RangerSplit<cr>
nnoremap \| :RangerVSplit<cr>

inoremap <F4> <C-R>=strftime("%H:%M:%S")<CR>
inoremap <F5> <C-R>=strftime("%Y-%m-%d %A")<CR>

function! WordProcessorMode()
  " Auto-capitalize script
  augroup SENTENCES
    au!
    autocmd InsertCharPre * if search('\v(%^|[.!?]\_s+|\_^\-\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
  augroup END
endfunction

command! WP call WordProcessorMode()
au BufNewFile,BufRead *.md call WordProcessorMode()

" wrap visually selected block with backticks
vnoremap <leader>~ c```<cr>```<esc>P
vnoremap <leader>` c``<esc>P
nnoremap <leader>` cE``<esc>PB
noremap <Space> :
