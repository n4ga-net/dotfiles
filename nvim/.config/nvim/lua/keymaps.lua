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
-- vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank to clipboard" })
-- vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank to clipboard" })
-- vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Yank line to clipboard" })

-- toggle line wrap with <leader>lw
vim.keymap.set('n', '<leader>lw', ':set wrap!<cr>', { desc = "Toggle line wrap" })

-- Set top folder in nvimtree
vim.keymap.set('n', '<leader>tf', function()
  require("nvim-tree.api").tree.change_root_to_node()
end, { desc = "Set top folder in nvim-tree" })

-- Disable arrow keys in normal, insert, and visual modes
vim.keymap.set({'n', 'v'}, '<Up>', '<Nop>')
vim.keymap.set({'n', 'v'}, '<Down>', '<Nop>')
vim.keymap.set({'n', 'v'}, '<Left>', '<Nop>')
vim.keymap.set({'n', 'v'}, '<Right>', '<Nop>')

-- Move between buffers in bufferline
vim.keymap.set('n', '<leader>bn', ':BufferLineCycleNext<CR>', { desc = "Next buffer" })
vim.keymap.set('n', '<leader>bp', ':BufferLineCyclePrev<CR>', { desc = "Previous buffer" })

-- Close buffers with bbye
vim.keymap.set('n', '<leader>bc', '<cmd>Bdelete<CR>', { desc = "Close buffer (keep window layout)" })
vim.keymap.set('n', '<leader>bC', '<cmd>Bwipeout<CR>', { desc = "Force close buffer (keep window layout)" })
