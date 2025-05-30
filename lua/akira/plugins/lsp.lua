return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- lsps I want Mason to install
				ensure_installed = {
					"clangd",
					-- "csharp_ls", broke
					"html",
					"lua_ls",
					"rust_analyzer",
					"ts_ls",
					"pyright",
					"tailwindcss",
					-- "ruby_lsp", broke
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- This tells lua_ls that 'vim' is a global
						},
					},
				},
			})
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			-- lspconfig.csharp_ls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			-- lspconfig.ruby_lsp.setup({
			-- 	capabilities = capabilities,
			-- 	cmd = {
			-- 		vim.fn.expand("~/.rbenv/shims/ruby"),
			-- 		"-S",
			-- 		"ruby-lsp",
			-- 	},
			-- 	root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
			-- })

			-- Add LSP diagnostic pop up under cursor
			vim.keymap.set("n", "<leader>e", function()
				vim.diagnostic.open_float(nil, {
					focusable = false,
					border = "rounded",
				})
			end, { desc = "Show diagnostic under cursor" })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
