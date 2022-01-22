require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,

    -- disable treesitter highlight for markdown because it eats up too much CPU
    disable = { 'markdown' }
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
  },
}
