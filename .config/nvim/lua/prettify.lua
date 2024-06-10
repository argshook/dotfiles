local filetype_to_plugin = {
  ['sql'] = '`fnm exec --using default npm root -g`/prettier-plugin-sql/lib/index.cjs'
}

local function prettify(filetype)
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local start_line = start_pos[2]
  local end_line = end_pos[2]

  if start_line == 0 or end_line == 0 then
    start_line = 1
    end_line = vim.fn.line('$')
  end

  local content = table.concat(vim.fn.getbufline('%', start_line, end_line), "\n")
  
  local temp_file = vim.fn.tempname()
  vim.fn.writefile(vim.split(content, "\n"), temp_file)

  local plugin_option = ''
  if filetype_to_plugin[filetype] then
    plugin_option = string.format("--plugin=%s", filetype_to_plugin[filetype])
  end

  local cmd = string.format(
    "prettier --stdin-filepath %s.%s %s --no-config --no-editorconfig --ignore-path '' < %s",
    temp_file,
    vim.fn.shellescape(filetype),
    plugin_option,
    temp_file
  )
  local output = vim.fn.systemlist(cmd)
  
  if vim.v.shell_error == 0 then
    vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, output)
  else
    vim.api.nvim_err_writeln(table.concat(output, "\n"))
    vim.api.nvim_err_writeln('Error: Prettier failed for filetype ' .. filetype)
  end

  vim.fn.delete(temp_file)
end

vim.api.nvim_create_user_command(
  'Pretty',
  function(params)
    prettify(params.args)
  end,
  { range = true, nargs = 1, complete = 'filetype' }
)
