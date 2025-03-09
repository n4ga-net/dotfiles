vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true

-- Keyaps
vim.keymap.set("v", "<leader><", "<gv", { desc = "Indent left" })
vim.keymap.set("v", "<leader>>", ">gv", { desc = "Indent right" })

vim.keymap.set("n", "<leader><", "<", { desc = "Indent left" })
vim.keymap.set("n", "<leader>>", ">", { desc = "Indent right" })

-- Keymapps
-- vim.keymap.set("v", "<leader><", indent_repeat("<gv"), { desc = "Indent left" })
-- vim.keymap.set("v", "<leader>>", indent_repeat(">gv"), { desc = "Indent right" })
-- vim.keymap.set("n", "<leader><", indent_repeat("<"), { desc = "Indent left" })
-- vim.keymap.set("n", "<leader>>", indent_repeat(">"), { desc = "Indent right" })

-- Set TOML filetype
vim.keymap.set("n", "<leader>ft", function()
  vim.bo.filetype = "toml"
  print("Filetype set to TOML")
end, { desc = "Set filetype to TOML" })

-- -- Automatically load toml if specified with #toml in the start of the file
-- vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
--   pattern = "*.conf",
--   callback = function()
--     if vim.fn.getline(1):match("^#toml") then
--       vim.bo.filetype = "toml"
--     end
--   end,
-- })
