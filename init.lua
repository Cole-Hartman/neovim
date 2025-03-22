require("akira")

-- Sync clipboard between OS and Neovim. :help 'clipboard'
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Save undo history
vim.opt.undofile = true


