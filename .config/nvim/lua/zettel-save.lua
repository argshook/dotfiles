local M = {}

function M.ZettelSave()
  vim.cmd('write')
  local home = os.getenv("HOME")
  local zettel = os.getenv("ZETTEL")
  local current_file = vim.fn.expand('%:p'):gsub("/$", "")  -- Remove possible trailing slash
  local zettel_public_dir = home .. "/zettel-public"

  local is_public = string.sub(current_file, 1, #zettel_public_dir) == zettel_public_dir
  local cwd = is_public and zettel_public_dir or zettel

  vim.fn.jobstart(
    "git add . && git commit -a -m '" .. os.date('%s') .. "'",
    { cwd = cwd, on_exit = function() vim.cmd('echo "Zettel saved."') end }
  )
end

return M
