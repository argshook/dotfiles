-- set runtimepath^=~/.vim
-- let &packpath = &runtimepath

local HOME = vim.fn.expand("~")
local set = vim.opt

local os = vim.fn.system("uname | awk '$1'")
if string.match(os, "Linux") then
  vim.g.python_host_prog = '/usr/bin/python'
  vim.g.python3_host_prog = '/usr/bin/python3'
elseif string.match(os, "Darwin") then
  vim.g.python_host_prog = '/usr/local/bin/python'
  vim.g.python3_host_prog = '/usr/local/bin/python3'
end

vim.g.mapleader = ","
set.backupdir = HOME .. "/.tmp/vim"
set.directory = HOME .. "/.tmp/vim"
set.backup = true
set.number = true
set.modeline = true
set.textwidth = 120
set.mouse = "a"
set.undofile = true
set.smartcase = true
set.ignorecase = true
set.inccommand = "split"
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

vim.cmd("source ~/.argsdotfiles/vim/plugins.vim")
vim.cmd("colorscheme cobalt2")
vim.cmd("highlight SignColumn ctermbg=NONE")
vim.cmd("highlight Search cterm=NONE ctermbg=NONE ctermfg=white ctermbg=19")
vim.cmd("highlight Folded cterm=NONE ctermbg=NONE ctermfg=darkgrey ctermbg=black")
vim.cmd("highlight VertSplit cterm=NONE ctermbg=NONE ctermfg=black ctermbg=black")

require('coc')
require('syntax-tree-surfer-config')

vim.cmd([[
autocmd BufEnter *.md set shiftwidth=2
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
source ~/.argsdotfiles/vim/grep.vim
source ~/.argsdotfiles/vim/curl.vim
source ~/.argsdotfiles/vim/prettify.vim
source ~/.argsdotfiles/vim/neosnippet.vim

let $PATH.='node_modules'
]])
