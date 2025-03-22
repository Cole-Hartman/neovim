vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("akira.lazy")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.g.have_nerd_font = true

-- Sync clipboard between OS and Neovim. :help 'clipboard'
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.number = true
vim.opt.relativenumber = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
