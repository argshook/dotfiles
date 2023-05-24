local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'tpope/vim-fugitive',
  'MunifTanjim/nui.nvim',
  'nvim-lua/plenary.nvim',
  'dpayne/CodeGPT.nvim',
  'tpope/vim-abolish',
  'tpope/vim-rhubarb',
  'tpope/vim-repeat',
  'tpope/vim-unimpaired',
  'wellle/targets.vim',
  'github/copilot.vim',
  'rafaqz/ranger.vim',
  'junegunn/fzf',
  'junegunn/fzf.vim',
  'nvim-treesitter/nvim-treesitter',
  'tpope/vim-obsession',
  'ziontee113/syntax-tree-surfer',
  'tpope/vim-surround',
  'mhinz/vim-signify',
  'christoomey/vim-tmux-navigator',
  'Shougo/neosnippet',
  'Shougo/neosnippet-snippets',
  'moll/vim-node',
  'nikvdp/ejs-syntax',
  'mattn/emmet-vim',
  {'neoclide/coc.nvim', run = 'coc#util#install()'},
  'lbrayner/vim-rzip',
  'suan/vim-instant-markdown',
  {'elmcast/elm-vim', ft = 'elm'},
  'tmsvg/pear-tree',
  'chrisbra/Colorizer',
  'junegunn/goyo.vim',
  'gertjanreynaert/cobalt2-vim-theme',
  'wellle/visual-split.vim',
  'dhruvasagar/vim-table-mode',
  'ggandor/leap.nvim',
  'nvim-colortils/colortils.nvim',
  'scrooloose/nerdcommenter',
  'yuttie/comfortable-motion.vim',
  'romainl/vim-qf',
  'simnalamburt/vim-mundo',
  'junegunn/vim-easy-align',
  'itchyny/lightline.vim',
})

require("colortils").setup({
    -- Register in which color codes will be copied
    register = "+",
    -- Preview for colors, if it contains `%s` this will be replaced with a hex color code of the color
    color_preview =  "█ %s",
    -- The default in which colors should be saved
    -- This can be hex, hsl or rgb
    default_format = "hex",
    -- Border for the float
    border = "rounded",
    -- Some mappings which are used inside the tools
    mappings = {
        -- increment values
        increment = "l",
        -- decrement values
        decrement = "h",
        -- increment values with bigger steps
        increment_big = "L",
        -- decrement values with bigger steps
        decrement_big = "H",
        -- set values to the minimum
        min_value = "0",
        -- set values to the maximum
        max_value = "$",
        -- save the current color in the register specified above with the format specified above
        set_register_default_format = "<m-cr>",
        -- save the current color in the register specified above with a format you can choose
        set_register_choose_format = "g<cr>",
        -- replace the color under the cursor with the current color in the format specified above
        replace_default_format = "<cr>",
        -- replace the color under the cursor with the current color in a format you can choose
        replace_choose_format = "g<m-cr>",
        -- export the current color to a different tool
        export = "E",
        -- set the value to a certain number (done by just entering numbers)
        set_value = "c",
        -- toggle transparency
        transparency = "T",
        -- choose the background (for transparent colors)
        choose_background = "B",
    }
})


vim.g.rg_command = 'rg --vimgrep --hidden --glob "!*-lock.json"'
vim.g.rg_highlight = 1
vim.g.rg_derive_root = 1
vim.g.rg_root_types = {'.git', 'package.json'}
vim.g.rg_format = 'f:l:c:m'

vim.g.codegpt_model = 'text-davinci-003'
vim.g.codegpt_max_tokens = '300'

vim.g.mundo_prefer_python3 = 1
vim.g.mundo_auto_preview = 0
vim.g.mundo_return_on_revert = 0

vim.g.surround_indent = 0
vim.g.tmux_navigator_disable_when_zoomed = 1 -- when tmux pane is zoomed, don't zoomout when navigating out of vim
vim.g.instant_markdown_autostart = 0 -- do npm i -g instant-markdown-d
vim.g.elm_make_show_warnings = 1
vim.g.elm_setup_keybindings = 0
vim.g.elm_detailed_complete = 1
vim.g.elm_format_autosave = 1
vim.g.elm_format_fail_silently = 0
