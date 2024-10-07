local M = {}

function M.commit_and_push()
  vim.cmd("wa")
  vim.cmd([[!git commit -am "update"]])
  vim.cmd("!git push")
end

function M.setup()
  vim.api.nvim_create_user_command('Deploy', function() M.commit_and_push() end, {})
end

M.setup()

return M
