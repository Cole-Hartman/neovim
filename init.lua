require("akira.lazy")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Sync clipboard between OS and Neovim. :help 'clipboard'
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.number = true
vim.opt.relativenumber = true

-- Save undo history
vim.opt.undofile = true


