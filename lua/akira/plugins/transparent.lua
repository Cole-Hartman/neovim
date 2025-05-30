return {
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				groups = { -- default groups
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"CursorLine",
					"CursorLineNr",
					"StatusLine",
					"StatusLineNC",
					"EndOfBuffer",
				},
				extra_groups = {
					"NormalFloat", -- plugins with float panels
					"NvimTreeNormal", -- NvimTree
				},
				exclude_groups = {}, -- groups you don't want to clear
			})
		end,
	},
}
