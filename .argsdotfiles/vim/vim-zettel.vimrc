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
call plug#end()

let mapleader = ","
set number
set ignorecase
set smartcase
set conceallevel=2
colorscheme cobalt2
let g:surround_indent = 0

source ~/.argsdotfiles/vim/fzf.vim
source ~/.argsdotfiles/vim/lightline.vim
source ~/.argsdotfiles/vim/comfortable-motion.vim

let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_toc_autofit = 1

" set scrolloff if the buffer is readonly (so mostly help files)
autocmd VimEnter,WinEnter,BufWinEnter */doc/*.txt set scrolloff=999
autocmd BufLeave,WinLeave */doc/*.txt set scrolloff=2

noremap <silent> <Esc> <Esc>:noh<cr>

function! MegaSave()
  write
  let cwd = getenv("HOME") . "/zettel"
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

command! ZettelIndex edit ~/zettel/index.md
nnoremap <silent> <leader>ww :ZettelIndex<cr>
