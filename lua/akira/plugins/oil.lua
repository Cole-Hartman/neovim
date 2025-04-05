return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		config = function()
			require("oil").setup({
				vim.keymap.set("n", "<leader>.", "<CMD>Oil<CR>", { desc = "Oil" }),
				view_options = {
					show_hidden = true,
				},
			})
		end,
	},
}
