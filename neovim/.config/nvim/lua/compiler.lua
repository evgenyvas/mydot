require("overseer").setup({
  templates = { "builtin", "user" },
})

-- Open tasks to run
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>OverseerRun<cr>", { noremap = true, silent = true })

-- Open compiler
vim.api.nvim_set_keymap("n", "<F6>", "<cmd>OverseerToggle<cr>", { noremap = true, silent = true })
