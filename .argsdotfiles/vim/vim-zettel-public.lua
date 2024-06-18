local path_helpers = require('pathutils')
local home = os.getenv("HOME")
local init_path = path_helpers.join_paths(home, ".config", "nvim", "init.lua")

vim.cmd('source ~/.argsdotfiles/vim/vim-zettel.lua')

vim.api.nvim_del_keymap('n', '<leader>ww')
vim.api.nvim_create_user_command('ZettelPublicIndex', function()
  vim.cmd('edit ~/zettel-public/index.md')
end, {})

local function Publish()
  local handle = io.popen("git diff origin/main --name-only")
  local modified_files = handle:read("*a")
  handle:close()
  
  local date = os.date("%Y-%m-%d")
  for file in modified_files:gmatch("[^\r\n]+") do
    local cmd = "sed -i 's/date-modified: [0-9-]\\{10,\\}/date-modified: " .. date .. "/' " .. file
    os.execute(cmd)
    vim.cmd('edit')
  end

  vim.cmd('call MegaSave()')
  vim.cmd('Git push origin main')
end

vim.api.nvim_create_user_command('Publish', Publish, {})

