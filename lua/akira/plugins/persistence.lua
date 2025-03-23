-- Lua
return {
	{
		"folke/persistence.nvim",
		opts = {},
		config = function()
			require("persistence").setup()
			vim.keymap.set("n", "<leader>r", function() require("persistence").load() end)
		end,
	}
}
