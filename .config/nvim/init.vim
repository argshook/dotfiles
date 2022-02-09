set runtimepath^=~/.vim
let &packpath = &runtimepath

let os = system("uname | awk '$1'")
if os =~ 'Linux'
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/bin/python3'
elseif os =~ 'Darwin'
  let g:python_host_prog = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

lua <<EOF
local HOME = vim.fn.expand("~")
local set = vim.opt

vim.g.mapleader = ","
set.backupdir = HOME .. "/.tmp/vim"
set.directory = HOME .. "/.tmp/vim"
set.backup = true
set.number = true
set.modeline = true
set.textwidth = 120
-- set.showmatch = true
-- set.visualbell = true
-- set.t_vb = ''
set.mouse = "a"
set.undofile = true
set.smartcase = true
set.ignorecase = true
set.inccommand = "split"
-- set.cindent = true
set.expandtab = true
set.shiftwidth = 2
set.shiftround = true
set.softtabstop = 2
set.smartindent = true
set.showtabline = 1
set.foldmethod = "indent"
set.foldlevelstart = 3
set.signcolumn = "yes"
set.showcmd = true
set.showmode = false
set.lazyredraw = true
set.conceallevel = 0
set.splitbelow = true
set.splitright = true
set.scrolloff = 2
set.previewheight = 20
set.undolevels = 1000
set.iskeyword:append("-")
set.listchars = {
  trail = '·',
  extends = '>',
  precedes = '<',
  nbsp = '%'
}
set.fillchars.eob = ' '
set.updatetime = 300
set.timeoutlen = 400
set.synmaxcol = 1000
EOF

source ~/.argsdotfiles/vim/plugins.vim

colorscheme cobalt2
highlight SignColumn ctermbg=NONE

autocmd BufEnter *.js set shiftwidth=2
" set scrolloff if the buffer is readonly (so mostly help files)
autocmd VimEnter,WinEnter,BufWinEnter */doc/*.txt set scrolloff=999
autocmd BufLeave,WinLeave */doc/*.txt set scrolloff=2

autocmd Filetype gitcommit,magit,markdown setlocal textwidth=72
autocmd Filetype ejs setlocal filetype=javascript.ejs
autocmd BufRead,BufNewFile *.css set filetype=scss

autocmd TermOpen * startinsert

source ~/.argsdotfiles/vim/keybindings.vim
source ~/.argsdotfiles/vim/abbreviations.vim
source ~/.argsdotfiles/vim/fzf.vim
source ~/.argsdotfiles/vim/coc.vim
source ~/.argsdotfiles/vim/grep.vim
source ~/.argsdotfiles/vim/curl.vim
source ~/.argsdotfiles/vim/prettify.vim

let $PATH.='node_modules'
