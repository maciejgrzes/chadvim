require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "jdtls", "lua_ls", "clangd", "jsonls" }
vim.lsp.enable(servers)
