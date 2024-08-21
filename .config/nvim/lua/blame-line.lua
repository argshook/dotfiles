-- inspired by https://github.com/tveskag/nvim-blame-line
-- rewritten to lua
-- added `delay` option
-- moved virtual text to the right of the screen

local api = vim.api
local fn = vim.fn

local M = {}

M.config = {
    git_format = '%an | %ar | %s',
    use_virtual_text = true,
    virtual_text_highlight = 'Comment',
    virtual_text_format = '%s',
    verbose = false,
    message_when_not_committed = 'Not yet committed',
    delay = 1000,
}

local ns_id = api.nvim_create_namespace('blame-line')

local function create_error(error)
    return function()
        if M.config.verbose then
            print('blame-line Error: ' .. vim.inspect(error))
        end
        M.disable_blame_line()
    end
end

local function clear_all()
    api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
end


local function nvim_annotate(comment, bufnr, lnum)
    clear_all()
    local win_width = api.nvim_win_get_width(0)
    local line_length = #api.nvim_buf_get_lines(bufnr, lnum - 1, lnum, false)[1]
    local line_num_width = #tostring(api.nvim_buf_line_count(bufnr))
    local sign_column_width = vim.fn.getwinvar(0, '&signcolumn') == 'yes' and 2 or 0
    local available_space = win_width - line_length - line_num_width - sign_column_width - 3

    local truncated_comment = comment
    if #comment > available_space then
        truncated_comment = comment:sub(1, available_space - 3) .. "..."
    end
    local padding = string.rep(' ', available_space - #truncated_comment)

    api.nvim_buf_set_extmark(bufnr, ns_id, lnum - 1, 0, {
        virt_text = {{padding .. truncated_comment, M.config.virtual_text_highlight}},
        virt_text_pos = 'eol',
    })
end


local function get_annotation(bufnr, lnum, gitdir)
    local git_parent = fn.fnamemodify(gitdir, ':h')
    local gitcommand = string.format('cd %s; git --git-dir=%s --work-tree=%s', git_parent, gitdir, git_parent)
    local blame = fn.systemlist(gitcommand .. ' annotate --contents - ' .. fn.expand('%:p') .. ' --porcelain -L ' .. lnum .. ',' .. lnum .. ' -M', bufnr)
    if vim.v.shell_error > 0 then
        vim.b.on_cursor_moved = create_error(blame)
        return
    end
    local commit = string.sub(blame[1], 1, 40)
    local format = M.config.git_format
    local annotation
    if commit == '0000000000000000000000000000000000000000' then
        annotation = {M.config.message_when_not_committed}
    else
        annotation = fn.systemlist(gitcommand .. ' show ' .. commit .. ' --format="' .. format .. '"')
    end
    if vim.v.shell_error > 0 then
        vim.b.on_cursor_moved = create_error(annotation)
        return
    end
    return string.format(M.config.virtual_text_format, annotation[1])
end


local function create_cursor_handler(bufnr, gitdir)
    local cursor_timer = nil
    local last_line = -1
    local last_annotation = nil

    local function handler(lnum)
        local comment = get_annotation(bufnr, lnum, gitdir)
        if comment then
            nvim_annotate(comment, bufnr, lnum)
            last_annotation = comment
        end
        last_line = lnum
    end

    return function(lnum)
        if cursor_timer then
            vim.loop.timer_stop(cursor_timer)
        end
        clear_all()
        cursor_timer = vim.defer_fn(function()
            handler(lnum)
        end, M.config.delay)
    end
end


local function get_cursor_handler()
    local gitdir = fn.systemlist('cd ' .. fn.expand('%:p:h') .. '; git rev-parse --git-dir')[1]
    if vim.v.shell_error > 0 then
        return create_error(gitdir)
    end
    if string.sub(gitdir, 1, 1) ~= '/' then
        gitdir = fn.expand('%:p:h') .. '/' .. gitdir
    end

    local rel_to_git_parent = fn.substitute(fn.expand('%:p'), fn.escape(fn.fnamemodify(gitdir, ':h') .. '/', '.'), '', '')
    local file_exists = fn.systemlist('cd ' .. fn.expand('%:p:h') .. '; git cat-file -e HEAD:' .. rel_to_git_parent)
    if vim.v.shell_error > 0 then
        return create_error(file_exists)
    end
    return create_cursor_handler(api.nvim_get_current_buf(), gitdir)
end

function M.init_blame_line()
    if not vim.b.toggle_blame_line then
        vim.b.on_cursor_moved = get_cursor_handler()
    else
        vim.b.on_cursor_moved = create_error('Blameline failed at init')
    end
end

function M.single_blame_line()
    if not vim.b.on_cursor_moved then
        vim.b.on_cursor_moved = create_error('Blameline failed')
    end
    vim.b.on_cursor_moved(api.nvim_win_get_cursor(0)[1])
    vim.cmd [[
        augroup showBlameLine
        autocmd! CursorMoved <buffer> lua require('blame-line').disable_blame_line()
        augroup END
    ]]
end

function M.enable_blame_line()
    if not vim.b.on_cursor_moved then
        vim.b.on_cursor_moved = create_error('Blameline failed')
    end
    vim.cmd [[
        augroup showBlameLine
        autocmd!
        autocmd CursorMoved <buffer> lua vim.b.on_cursor_moved(vim.api.nvim_win_get_cursor(0)[1])
        augroup END
    ]]
    vim.b.toggle_blame_line = M.disable_blame_line
end

function M.disable_blame_line()
    clear_all()
    vim.cmd [[
        autocmd! showBlameLine * <buffer>
    ]]
    vim.b.toggle_blame_line = M.enable_blame_line
end

function M.setup(opts)
    M.config = vim.tbl_extend('force', M.config, opts or {})
    vim.cmd [[
        augroup enableBlameLine
        autocmd!
        autocmd BufReadPre,FileReadPre * lua require('blame-line').init_blame_line()
        augroup END
    ]]
    vim.cmd [[
        command! ToggleBlameLine lua vim.b.toggle_blame_line()
        command! EnableBlameLine lua require('blame-line').enable_blame_line()
        command! DisableBlameLine lua require('blame-line').disable_blame_line()
        command! SingleBlameLine lua require('blame-line').single_blame_line()
    ]]
end

return M
