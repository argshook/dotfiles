local path_helpers = require('pathutils')
local home = os.getenv("HOME")
local init_path = path_helpers.join_paths(home, ".config", "nvim", "init.lua")

vim.cmd("source " .. vim.fn.expand(init_path))

vim.api.nvim_set_keymap('n', '<leader>s', ':lua require("zettel-save").ZettelSave()<CR>', { noremap = true, silent = true })

local function PlayYoutube()
  local line = vim.fn.getline('.')
  local cmd = "radio youtube '" .. line .. "'"
  vim.cmd('botright new')
  vim.fn.termopen(cmd, {detach = 0})
end

vim.api.nvim_set_keymap('n', '<leader>m', ':lua PlayYoutube()<CR>', { noremap = true, silent = true })

local function DirifyNote()
  local filename = vim.fn.expand('%:p')
  local dirname = vim.fn.expand('%:p:r')
  local movedFilename = dirname .. "/index.md"
  vim.fn.system("mkdir " .. dirname)
  vim.fn.system("mv " .. filename .. " " .. movedFilename)
  vim.cmd("edit " .. movedFilename)
end

vim.api.nvim_create_user_command('DirifyNote', DirifyNote, {})

local function EditZettelIndex()
  local zettel = os.getenv("ZETTEL")
  vim.cmd("edit " .. zettel .. "/index.md")
end

vim.api.nvim_create_user_command('ZettelIndex', EditZettelIndex, {})

vim.api.nvim_set_keymap('n', '<leader>ww', ':ZettelIndex<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '-', ':RangerEdit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '_', ':RangerSplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '|', ':RangerVSplit<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<F4>', '<C-R>=strftime("%H:%M:%S")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<F5>', '<C-R>=strftime("%Y-%m-%d %A")<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<leader>~', 'c```<cr>```<esc>P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>`', 'c``<esc>P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>`', 'cE``<esc>PB', { noremap = true, silent = true })

vim.api.nvim_set_keymap('', '<Space>', ':', { noremap = true })
