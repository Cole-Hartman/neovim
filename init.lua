-- MAC CHANGES -------------

-- Codespace ssh clipboard support
if vim.fn.has("nvim-0.10") == 1 then
	local function copy(lines, _)
		local text = table.concat(lines, "\n")
		local encoded = vim.fn.system('base64 | tr -d "\n"', text)
		vim.fn.chansend(vim.v.stderr, "\x1b]52;c;" .. encoded .. "\x07")
	end

	local function paste()
		return { vim.fn.getreg(""), vim.fn.getregtype("") }
	end

	vim.g.clipboard = {
		name = "osc52",
		copy = { ["+"] = copy, ["*"] = copy },
		paste = { ["+"] = paste, ["*"] = paste },
	}
end

-----------------------------

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
vim.opt.relativenumber = false -- my cowerkers can't read my line numbers

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 50

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show which line your cursor is on
-- vim.opt.cursorline = true

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

-- get rid of annoying q: command
vim.keymap.set("n", "q:", "<Nop>", { noremap = true, silent = true })
