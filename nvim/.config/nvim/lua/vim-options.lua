vim.g.mapleader = " "

-- tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- opts
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.clipboard = 'unnamedplus'

-- Confirm before closing with unsaved changes
vim.o.confirm = true
