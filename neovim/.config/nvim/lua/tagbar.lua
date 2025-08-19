local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<F4>", ":TagbarToggle<CR>", opts) -- show on F4
