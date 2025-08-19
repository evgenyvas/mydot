-----------------------------------------
-- General settings
-----------------------------------------

HOME = os.getenv("HOME")
EDITOR_ROOT = HOME .. "/.config/nvim"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true -- enable 24-bit colour
vim.opt.background = "dark"
vim.opt.backspace = "indent,eol,start"
vim.opt.mouse = "a"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.guicursor:append("a:blinkon0")  -- Disable all blinking
vim.opt.switchbuf:append("usetab,newtab")
vim.opt.colorcolumn = "80" -- highlights 80 column limit
vim.opt.cursorline = true -- highlight line with cursor
vim.opt.clipboard:append("unnamedplus") -- always use X11 clipboard
vim.opt.dictionary = "/usr/dict/words"

-- Syntax highlighting and filetype plugins
vim.cmd("syntax on")
vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype plugin indent on")

-- show invisible characters
vim.opt.list = true
vim.opt.listchars = { tab = "▸\\ ", trail = "·", nbsp = "_" }

-- disable beeping
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.api.nvim_create_autocmd("GUIEnter", {
  pattern = "*",
  command = "set visualbell ="
})

-- working directory
vim.opt.backupdir = "/tmp"
vim.opt.directory = "/tmp"


-----------------------------------------
-- Mapping keys
-----------------------------------------

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- paste on new line
map("n", "<leader>p", ":pu<CR>", opts)
map("n", "<leader>P", ":pu!<CR>", opts)

map("x", "p", "pgvy", opts) -- don't copy substituted text while paste

-- stamp a yanked text to S
map("n", "S", "diw\"0P", opts)
map("v", "S", "\"_d\"0P", opts)

-- save file
map("n", "<c-s>", ":w<CR>", opts)
map("i", "<c-s>", "<Esc>:w<CR>a", opts)
map("i", "<c-s>", "<Esc><c-s>", opts)

-- searching
map("n", "*", "*N", opts) -- on star not jump to next found text
-- press F8 to toggle highlighting on/off, and show current value
map("n", "<F8>", ":set hlsearch! hlsearch?<CR>", opts)
-- search for visually selected text by //
map("v", "//", "y/<C-R>\"<CR>", opts)


-----------------------------------------
-- Indentation settings
-----------------------------------------

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.autoindent = true

-- after change indentation for many lines visual select is not disappear
map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)


-----------------------------------------
-- Plugins with dependencies
-----------------------------------------
require("plugins") -- plugin manager

-- essential plugins first
require("treesitter") -- set up before LSP for better highlighting
require("lsp") -- depends on language servers being available
require("completion") -- depends on LSP configuration
require("searching") -- often integrates with LSP
require("layout") -- keyboard layout switching setup

-- ui plugins last
require("theme")
require("statusline")
require("tagbar")
require("filemanager")
require("tabs")
require("tags")
