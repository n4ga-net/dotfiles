vim.g.mapleader = " "

-- tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- opts
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wrap = false
-- vim.opt.clipboard = 'unnamedplus'

-- Improve search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Confirm before closing with unsaved changes
vim.o.confirm = true

-- automatic attach tree-sitter if we find a parser
vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    local ft = vim.bo[ev.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft) or ft
    pcall(vim.treesitter.start, ev.buf, lang)
  end,
})
