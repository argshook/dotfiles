-- Load external configurations
vim.cmd('source ~/.config/nvim/init.lua')
vim.cmd('source ~/.argsdotfiles/vim/abbreviations.vim')
require('prettify')

-- Define FocusGained function
function FocusGained()
  vim.cmd('normal ggVG"+P')
  if vim.b.cursor_pos then
    vim.fn.cursor(vim.b.cursor_pos[1], vim.b.cursor_pos[2])
  end
end

-- Define FocusLost function
function FocusLost()
  vim.b.cursor_pos = vim.fn.getpos('.')
  vim.cmd('normal ggVG"+y')
end

-- Set autocommands
vim.api.nvim_exec([[
  augroup MarkdownAutocommands
    autocmd!
    autocmd FocusGained *.md lua FocusGained()
    autocmd FocusLost *.md lua FocusLost()
    autocmd Filetype *.md setlocal textwidth=80
  augroup END
]], false)

-- Map Ctrl-k in insert mode
vim.api.nvim_set_keymap('i', '<c-k>', '<Esc>:call g:FzfSearchDigraphs()<CR>', { noremap = true })

-- Set filetype mappings
vim.api.nvim_set_keymap('n', '<leader>fj', ':set ft=javascript.jsx<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fm', ':set ft=markdown<CR>', { silent = true, noremap = true })

-- Define MegaSave function
function MegaSave()
  local zettel = os.getenv("ZETTEL")
  local date = vim.fn.trim(vim.fn.system("date +%Y-%m-%d-%H-%M-%S"))
  vim.cmd('saveas ' .. zettel .. '/scratchpad/' .. date .. '.md')
  vim.fn.system("cd " .. zettel .. " && git add " .. zettel .. "/scratchpad/*")
  vim.fn.system("cd " .. zettel .. " && git commit -a -m `date \'+%s\'`")
end

-- Map Leader+s to MegaSave
vim.api.nvim_set_keymap('n', '<leader>s', ':lua MegaSave()<CR>', { noremap = true })
