
if vim.fn.executable("xkb-switch") == 1 then
  require("xkbswitch").setup()
else
  -- fallback switching by <C-F> if xkb-switch not installed
  vim.opt.keymap = "russian-jcukenwin"

  -- default layout is english
  vim.opt.iminsert = 0
  vim.opt.imsearch = 0

  -- layout switching by <C-F>
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  map("c", "<C-F>", "<C-^>", opts)
  map("i", "<C-F>", "<C-^>", opts)
  map("n", "<C-F>", "a<C-^>", opts)
  map("v", "<C-F>", "<Esc>a<C-^>gv", opts)
end
