local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    "nvim-lua/plenary.nvim", -- Utility functions (dependency for many plugins)
    { -- treesitter configurations and abstraction layer
      "nvim-treesitter/nvim-treesitter",
      branch = 'master',
      lazy = false,
      build = ":TSUpdate",
      priority = 100 -- Load early
    },
    { -- quickstart configs for Nvim LSP
      "neovim/nvim-lspconfig",
      dependencies = {
        -- Server installation manager
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
      }
    },
    { -- autocomplete
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
        "hrsh7th/cmp-buffer",   -- Buffer source
        "hrsh7th/cmp-path",     -- Path source
        "hrsh7th/cmp-cmdline",  -- Cmdline source
        "hrsh7th/cmp-vsnip",    -- Vim-vsnip source
        "hrsh7th/vim-vsnip",    -- Snippet engine
        "honza/vim-snippets",   -- Snippets
      }
    },
    { -- searching
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      version = "*"
    },
    { -- task runner
      "stevearc/overseer.nvim",
      version = "*",
      opts = {}
    },
    { -- smart automatic keyboard layout switching
      "ivanesmantovich/xkbswitch.nvim"
    },
    { -- file navigation
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    { -- statusline
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    { -- list of methods, classes and variables
      "preservim/tagbar"
    },
    { -- easy comment
      "preservim/nerdcommenter"
    },
    { -- auto close and auto rename html tag
      "windwp/nvim-ts-autotag",
      lazy = false
    },
    { -- auto close brackets
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true
    },
    { -- highlight tags
      "gregsexton/MatchTag"
    },
    { -- toggle relative numbers
      "jeffkreeftmeijer/vim-numbertoggle"
    },
    { -- git integration for buffers
      "lewis6991/gitsigns.nvim"
    },
    { -- tabs
      "romgrk/barbar.nvim",
      dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons"
      },
      version = "*"
    },
    { -- monokai theme
      "tanvirtin/monokai.nvim"
    }
  },
  checker = {
    -- automatically check for plugin updates
    enabled = false
  }
})
