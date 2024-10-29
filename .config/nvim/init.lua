-- set runtimepath^=~/.vim
-- let &packpath = &runtimepath

local platform = vim.fn.system("uname | awk '$1'")
if string.match(platform, "Linux") then
  vim.g.python_host_prog = '/usr/bin/python'
  vim.g.python3_host_prog = '/usr/bin/python3'
elseif string.match(platform, "Darwin") then
  vim.g.python_host_prog = '/usr/local/bin/python'
  vim.g.python3_host_prog = '/usr/local/bin/python3'
end

local HOME = vim.fn.expand("~")
vim.g.mapleader = ","
vim.opt.backupdir = HOME .. "/.tmp/vim"
vim.opt.directory = HOME .. "/.tmp/vim"
vim.opt.backup = true
vim.opt.number = true
vim.opt.modeline = true
vim.opt.textwidth = 120
vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.showtabline = 1
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 3
vim.opt.signcolumn = "yes"
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.lazyredraw = true
vim.opt.conceallevel = 0
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 2
vim.opt.previewheight = 20
vim.opt.undolevels = 1000
vim.opt.iskeyword:append("-")
vim.opt.listchars = {
  trail = '·',
  extends = '>',
  precedes = '<',
  nbsp = '%'
}
vim.opt.list = true
vim.opt.fillchars.eob = ' '
vim.opt.updatetime = 300
vim.opt.timeoutlen = 400
vim.opt.synmaxcol = 1000

require('plugins')
require('treesitter')
require('coc')
require('syntax-tree-surfer-config')
require('prettify')
require('commit-and-push')
require('leap').add_default_mappings()
vim.cmd("source ~/.argsdotfiles/vim/lightline.vim")
vim.cmd("source ~/.argsdotfiles/vim/comfortable-motion.vim")
vim.cmd.colorscheme "tokyonight"
vim.cmd("highlight SignColumn ctermbg=NONE")
vim.cmd("highlight Search cterm=NONE ctermbg=NONE ctermfg=white ctermbg=19")
vim.cmd("highlight VertSplit cterm=NONE ctermbg=NONE ctermfg=black ctermbg=black")

local function keymapOptions(desc)
  return {
    noremap = true,
    silent = true,
    nowait = true,
    desc = "GPT prompt " .. desc,
  }
end

vim.keymap.set({ "n", "i" }, "<C-g>c", "<cmd>GpChatNew split<cr>", keymapOptions("New Chat split"))
vim.keymap.set("v", "<C-g>c", ":<C-u>'<,'>GpChatNew split<cr>", keymapOptions("Visual Chat New split"))


vim.cmd([[
autocmd BufRead,BufNewFile * match TODO /@TODO/
autocmd BufRead,BufNewFile * highlight TODO ctermbg=None guibg=None ctermfg=DarkMagenta guifg=DarkMagenta

set completeopt-=preview
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
source ~/.argsdotfiles/vim/neosnippet.vim

let $PATH.='node_modules'
]])


vim.api.nvim_create_user_command('DenoRestart', 'CocCommand deno.restart', {})
