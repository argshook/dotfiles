vim.g.coc_global_extensions = {
  'coc-eslint',
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

local set = vim.keymap.set

set('n', '[l', '<Plug>(coc-diagnostic-prev)')
set('n', ']l', '<Plug>(coc-diagnostic-next)')
set('n', '<leader>rn', '<Plug>(coc-rename)')
set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
set('n', 'gD', '<Plug>(coc-declaration)', { silent = true })
set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
set('n', 'gy', '<Plug>(coc-diagnostic-info)', { silent = true })
set('n', 'gr', '<Plug>(coc-references)', { silent = true })
set('n', 'go', ':CocList outline<cr>', { silent = true })
set('n', '<leader>qf', '<Plug>(coc-fix-current)')
set('n', '<leader>ac', '<Plug>(coc-codeaction)')
set('n', 'K', function() show_documentation() end)

set('i', '<c-space>', 'coc#refresh()', { silent = true, expr = true })

vim.cmd([[
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
]])
