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
    lazy = false,
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc", "html", "css", "python", "java", "c", "cpp"
      },
    },
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000
  },

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
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "nvchad.configs.nvimtree"
    end,
  },

  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text"
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui") 
      require("nvim-dap-virtual-text").setup()

      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end

      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end

      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch executable",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      local map = vim.keymap.set

      map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
      map("n", "<leader>dc", dap.continue, { desc = "DAP continue/start" })
      map("n", "<leader>dn", dap.step_over, { desc = "DAP step over" })
      map("n", "<leader>di", dap.step_into, { desc = "DAP step into" })
      map("n", "<leader>do", dap.step_out, { desc = "DAP step out" })
      map("n", "<leader>dr", dap.repl.open, { desc = "DAP REPL" })
      map("n", "<leader>du", dapui.toggle, { desc = "DAP UI toggle" })
    end,
  },

  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()
    end,
  }
}
