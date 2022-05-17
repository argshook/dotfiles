-- Normal Mode Swapping
vim.api.nvim_set_keymap("n", "vd", '<cmd>lua require("syntax-tree-surfer").move("n", false)<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "vu", '<cmd>lua require("syntax-tree-surfer").move("n", true)<cr>', {noremap = true, silent = true})

-- Visual Mode Swapping
vim.api.nvim_set_keymap("x", "<A-j>", '<cmd>lua require("syntax-tree-surfer").surf("next", "visual", true)<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("x", "<A-k>", '<cmd>lua require("syntax-tree-surfer").surf("prev", "visual", true)<cr>', {noremap = true, silent = true})
