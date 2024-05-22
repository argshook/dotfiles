local function prettify(filetype)
  local start_line, _, end_line, _ = unpack(vim.fn.getpos("'<")), unpack(vim.fn.getpos("'>"))
  if start_line == 0 or end_line == 0 then
    start_line = 1
    end_line = vim.fn.line('$')
  end

  -- Capture current content within range
  local content = table.concat(vim.fn.getbufline('%', start_line, end_line), "\n")

  -- Escape content and write to a temporary file
  local temp_file = vim.fn.tempname()
  vim.fn.writefile(vim.split(content, "\n"), temp_file)
  
  -- Run Prettier
  local cmd = string.format("prettier --stdin-filepath %s.%s --no-config --no-editorconfig --ignore-path '' < %s", temp_file, vim.fn.shellescape(filetype), temp_file)
  local output = vim.fn.systemlist(cmd)
  
  if vim.v.shell_error == 0 then
    -- Replace buffer content only if no errors
    vim.api.nvim_buf_set_lines(0, start_line-1, end_line, false, output)
  else
    -- Display error message if Prettier failed
    vim.api.nvim_err_writeln('Error: Prettier failed for filetype ' .. filetype)
  end

  -- Clean up temporary file
  vim.fn.delete(temp_file)
end

vim.api.nvim_create_user_command(
  'Pretty',
  function(params)
    prettify(params.args)
  end,
  { range = true, nargs = 1, complete = 'filetype' }
)
