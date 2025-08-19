vim.g.barbar_auto_setup = false -- disable auto-setup

require("barbar").setup({
  animation = true
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Meta + arrows will switch tabs
map("n", "<M-Right>", "<Cmd>BufferNext<CR>", opts)
map("n", "<M-Left>", "<Cmd>BufferPrevious<CR>", opts)

-- rearrange tabs by ctrl + shift + arrows
map("n", "<C-S-Left>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<C-S-Right>", "<Cmd>BufferMoveNext<CR>", opts)
