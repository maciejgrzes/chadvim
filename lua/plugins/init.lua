return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc", "html", "css", "python", "java", "c", "cpp"
      },
    },
  },

  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  { "numToStr/Comment.nvim", },

  {
    "mbbill/undotree",
    lazy = false,
  },

  {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_method = "latexmk"
    end,
  }
}
