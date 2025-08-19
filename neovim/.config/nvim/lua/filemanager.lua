require("nvim-tree").setup({
  on_attach = function(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '?',     api.tree.toggle_help, opts('Help'))
  end,
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<F3>", ":NvimTreeToggle<CR>", opts) -- show on F3
