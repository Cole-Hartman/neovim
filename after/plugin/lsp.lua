require("mason").setup()

require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls" }
}

-- MASON-LSPCONFIG, lsp management for mason
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.ts_ls.setup{}

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
