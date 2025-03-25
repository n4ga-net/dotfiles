-- Standard
vim.keymap.set("v", "<leader><", "<gv", { desc = "Indent left" })
vim.keymap.set("v", "<leader>>", ">gv", { desc = "Indent right" })
vim.keymap.set("n", "<leader><", "<", { desc = "Indent left" })
vim.keymap.set("n", "<leader>>", ">", { desc = "Indent right" })
vim.keymap.set("n", "Q", "<Nop>", { desc = "Disable Ex mode" })

-- make scroll better
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page" })

-- make search with / better
vim.keymap.set("n", "n", "nzzzzv", { desc = "Search next" })
vim.keymap.set("n", "N", "Nzzzzv", { desc = "Search previous" })
-- clear search
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Paste without overwriting clipboard
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste preserved" })

-- Move Selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Move line below to end of current line" })

-- Yank to external clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank to clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Yank line to clipboard" })

-- Set TOML filetype
vim.keymap.set("n", "<leader>ft", function()
  vim.bo.filetype = "toml"
  print("Filetype set to TOML")
end, { desc = "Set filetype to TOML" })

-- NvimTree change root folder
vim.keymap.set("n", "<leader>cd", "<C-]>", { desc = "NvimTree change root folder" })

-- Obsidian
vim.keymap.set('n', '<leader>nt', ':ObsidianTemplate<cr>', { desc = "Obsidian Template" })
vim.keymap.set('n', '<leader>nn', ':ObsidianNewFromTemplate<cr>', { desc = "Obsidian New Note" })

-- toggle line wrap with <leader>lw
vim.keymap.set('n', '<leader>lw', ':set wrap!<cr>', { desc = "Toggle line wrap" })
