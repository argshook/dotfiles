local function prettify(filetype)
  -- Get the current visual selection or the whole buffer if no selection
  local start_line, _, end_line, _ = unpack(vim.fn.getpos("'<")), unpack(vim.fn.getpos("'>"))
  if start_line == 0 or end_line == 0 then
    -- No selection, set to the whole buffer
    start_line = 1
    end_line = vim.fn.line('$')
  end

  -- Run Prettier
  local command = string.format("%d,%d! prettier --stdin-filepath filename.%s", start_line, end_line, vim.fn.shellescape(filetype))
  vim.cmd(command)
end

vim.api.nvim_create_user_command(
  'Pretty',
  function(params)
    prettify(params.args)
  end,
  { range = true, nargs = 1, complete = 'filetype' }
)
