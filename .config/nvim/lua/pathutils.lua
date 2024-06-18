local M = {}

function M.join_paths(...)
    local sep = package.config:sub(1, 1)
    return table.concat({...}, sep)
end

return M
