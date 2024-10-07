local utils = require('map_utils')
local lua_fn = utils.lua_fn
local key = vim.api.nvim_set_keymap

vim.g.coc_global_extensions = {
  'coc-eslint',
  'coc-prettier',
  'coc-tsserver',
  'coc-pyright',
  'coc-lua',
  'coc-json',
  '@yaegassy/coc-tailwindcss3',
  'coc-deno'
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
key('n', '<leader>rr', '<Plug>(coc-refactor)' , {})
key('n', '<leader>f', '<Plug>(coc-format)' , {})
key('n', 'gd', '<Plug>(coc-definition)', { silent = true })
key('n', '<leader>gd', '<Plug>(coc-type-definition)', { silent = true })
key('n', 'gD', '<Plug>(coc-declaration)', { silent = true })
key('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
key('n', 'gy', '<Plug>(coc-diagnostic-info)', { silent = true })
key('n', 'gr', '<Plug>(coc-references-used)', { silent = true })
key('n', 'go', ':CocList outline<cr>', { silent = true })
key('n', '<leader>qf', '<Plug>(coc-fix-current)', {})
key('n', '<leader>ac', '<Plug>(coc-codeaction-cursor)', {})
key('v', '<leader>ac', '<Plug>(coc-codeaction)', {})
key('n', 'K', lua_fn(function() show_documentation() end), {})

key('i', '<c-space>', 'coc#refresh()', { silent = true, expr = true })

vim.cmd([[
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
]])

vim.cmd([[
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]])


vim.cmd("highlight CocMenuSel ctermfg=236 ctermbg=220 guifg=#3A3A3A guibg=#FFC600")

