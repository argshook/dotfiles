local utils = require('map_utils')
local lua_fn = utils.lua_fn
local key = vim.api.nvim_set_keymap

vim.g.coc_global_extensions = {
  'coc-eslint',
  'coc-prettier',
  'coc-tsserver',
  'coc-pyright',
  'coc-lua',
  'coc-json'
  }

local function show_documentation()
  local filetype = vim.bo.filetype
  if filetype == 'vim' or filetype == 'help' then
    vim.api.nvim_command('help ' .. vim.fn.expand('<cword>'))
  elseif filetype == 'dockerfile' then
    vim.api.nvim_command(':DD ' .. filetype .. " " .. vim.fn.expand('<cword>'))
  else
    vim.fn.CocActionAsync('doHover')
  end
end

key('n', '[l', '<Plug>(coc-diagnostic-prev)', {})
key('n', ']l', '<Plug>(coc-diagnostic-next)', {})
key('n', '<leader>rn', '<Plug>(coc-rename)' , {})
key('n', 'gd', '<Plug>(coc-definition)', { silent = true })
key('n', 'gD', '<Plug>(coc-declaration)', { silent = true })
key('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
key('n', 'gy', '<Plug>(coc-diagnostic-info)', { silent = true })
key('n', 'gr', '<Plug>(coc-references)', { silent = true })
key('n', 'go', ':CocList outline<cr>', { silent = true })
key('n', '<leader>qf', '<Plug>(coc-fix-current)', {})
key('n', '<leader>ac', '<Plug>(coc-codeaction)', {})
key('n', 'K', lua_fn(function() show_documentation() end), {})

key('i', '<c-space>', 'coc#refresh()', { silent = true, expr = true })

vim.cmd([[
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
]])
