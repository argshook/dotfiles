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
  {
    'tpope/vim-fugitive',
    config = function()
      vim.cmd([[
        autocmd BufReadPost fugitive://* set bufhidden=delete
        function! s:ftplugin_fugitive() abort
          nnoremap <buffer> <silent> cc :Git commit --quiet<CR>
          nnoremap <buffer> <silent> ca :Git commit --quiet --amend<CR>
          nnoremap <buffer> <silent> ce :Git commit --quiet --amend --no-edit<CR>
        endfunction

        augroup nhooyr_fugitive
          autocmd!
          autocmd FileType fugitive call s:ftplugin_fugitive()
        augroup END
        nnoremap <silent> <leader>gs :G<cr>
        autocmd User FugitiveEditor startinsert

        imap <silent><script><expr> <C-F> copilot#Accept("\<CR>")
      ]])
    end
  },

  {
    "robitx/gp.nvim",
    config = function()
      require("gp").setup()
    end,
  },

  'tpope/vim-rhubarb',
  'tpope/vim-repeat',
  'tpope/vim-unimpaired',
  'wellle/targets.vim',
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_filetypes = {
        markdown = true,
        gitcommit = true,
      }
    end
  },
  'rafaqz/ranger.vim',
  'junegunn/fzf',
  'junegunn/fzf.vim',
  'nvim-treesitter/nvim-treesitter',
  'tpope/vim-obsession',
  'ziontee113/syntax-tree-surfer',
  {
  'tpope/vim-surround',
    config = function()
      vim.g.surround_indent = 0
    end
  },

  'mhinz/vim-signify',
  {
    'christoomey/vim-tmux-navigator',
    config = function()
      vim.g.tmux_navigator_disable_when_zoomed = 1 -- when tmux pane is zoomed, don't zoomout when navigating out of vim
    end
  },
  'Shougo/neosnippet',
  'Shougo/neosnippet-snippets',
  'moll/vim-node',
  'nikvdp/ejs-syntax',
  'mattn/emmet-vim',
  {'neoclide/coc.nvim', run = 'coc#util#install()'},
  'lbrayner/vim-rzip',
  {
    'suan/vim-instant-markdown',
    config = function()
      vim.g.instant_markdown_autostart = 0 -- do npm i -g instant-markdown-d
    end
  },
  {
    'elmcast/elm-vim',
    ft = 'elm',
    config = function()
      vim.g.elm_make_show_warnings = 1
      vim.g.elm_setup_keybindings = 0
      vim.g.elm_detailed_complete = 1
      vim.g.elm_format_autosave = 1
      vim.g.elm_format_fail_silently = 0

      vim.cmd([[
          autocmd FileType elm nmap <leader>m <Plug>(elm-make)
          autocmd FileType elm nmap <leader>M <Plug>(elm-make-main)
          autocmd FileType elm nmap <leader>d <Plug>(elm-error-detail)
          autocmd BufWritePost *.elm ElmMake
      ]])
    end
  },
  'tmsvg/pear-tree',
  'chrisbra/Colorizer',
  'junegunn/goyo.vim',
  'gertjanreynaert/cobalt2-vim-theme',
  'dhruvasagar/vim-table-mode',
  'ggandor/leap.nvim',
  'nvim-colortils/colortils.nvim',
  {
    'scrooloose/nerdcommenter',
    config = function()
      vim.g.NERDSpaceDelims = 1
      vim.g.NERDCustomDelimiters = {
        javascript = {
          left = "//",
          leftAlt = "/**",
        }
      }
    end
  },
  'yuttie/comfortable-motion.vim',
  'romainl/vim-qf',
  {
    'simnalamburt/vim-mundo',
    config = function()
      vim.g.mundo_prefer_python3 = 1
      vim.g.mundo_auto_preview = 0
      vim.g.mundo_return_on_revert = 0
      vim.cmd("nnoremap <F6> :MundoToggle<CR>")
    end
  },
  'junegunn/vim-easy-align',
  'itchyny/lightline.vim',
})

require("colortils").setup({
    register = "+",
    color_preview =  "█ %s",
    default_format = "hex",
    border = "rounded",
    mappings = {
        increment = "l",
        decrement = "h",
        increment_big = "L",
        decrement_big = "H",
        min_value = "0",
        max_value = "$",
        set_register_default_format = "<m-cr>",
        set_register_choose_format = "g<cr>",
        replace_default_format = "<cr>",
        replace_choose_format = "g<m-cr>",
        export = "E",
        set_value = "c",
        transparency = "T",
        choose_background = "B",
    }
})
