-- =============================================================================
-- <leader> Indent
-- =============================================================================
-- Standard
vim.keymap.set("v", "<leader><", "<gv", { desc = "Indent left" })
vim.keymap.set("v", "<leader>>", ">gv", { desc = "Indent right" })
vim.keymap.set("n", "<leader><", "<", { desc = "Indent left" })
vim.keymap.set("n", "<leader>>", ">", { desc = "Indent right" })

-- =============================================================================
-- Single-key / Normal-mode tweaks
-- =============================================================================
-- Standard
vim.keymap.set("n", "Q", "<Nop>", { desc = "Disable Ex mode" })

-- =============================================================================
-- <C-*> Scrolling
-- =============================================================================
-- make scroll better
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page" })

-- =============================================================================
-- Search navigation
-- =============================================================================
-- make search with / better
vim.keymap.set("n", "n", "nzzzv", { desc = "Search next (centered)", nowait = true })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search prev (centered)", nowait = true })

-- =============================================================================
-- <leader> Search
-- ===========================================================================
-- clear search
vim.keymap.set("n", "<leader>sc", ":nohl<CR>", { desc = "Clear search highlights" })

-- =============================================================================
-- <leader> Paste
-- =============================================================================
-- Paste without overwriting clipboard
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste preserved" })

-- =============================================================================
-- J/K line movement
-- =============================================================================
-- Move Selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Move line below to end of current line" })

-- =============================================================================
-- <leader> Yank / Clipboard
-- =============================================================================
-- Yank to external clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })

-- =============================================================================
-- <leader> Layout / Lines
-- =================================== =========================================
-- toggle line wrap with <leader>tw
vim.keymap.set("n", "<leader>tw", ":set wrap!<cr>", { desc = "Toggle line wrap" })

-- =============================================================================
-- <leader> Tree
-- =============================================================================
-- Set top folder in nvimtree
vim.keymap.set("n", "<leader>tf", function()
	require("nvim-tree.api").tree.change_root_to_node()
end, { desc = "Set top folder in nvi:m-tree" })

-- =============================================================================
-- Arrow keys disabled
-- =============================================================================
-- Disable arrow keys in normal, insert, and visual modes
vim.keymap.set({ "n", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<Right>", "<Nop>")

-- =============================================================================
-- <leader>b Buffers
-- =============================================================================
-- Move between buffers in bufferline
vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

-- Close buffers with bbye
vim.keymap.set("n", "<leader>bc", "<cmd>Bdelete<CR>", { desc = "Close buffer (keep window layout)" })
vim.keymap.set("n", "<leader>bC", "<cmd>Bwipeout<CR>", { desc = "Force close buffer (keep window layout)" })

-- =============================================================================
-- <leader>g Go To: Plugins
-- =============================================================================
-- Keybinds to open plugin UI's
vim.keymap.set("n", "<leader>gl", ":Lazy<CR>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>gm", ":Mason<CR>", { desc = "Mason" })
vim.keymap.set("n", "<leader>gg", ":LazyGit<cr>", { desc = "LazyGit" })
vim.keymap.set("n", "<leader>gc", ":Huefy<cr>", { desc = "Pick Color (Huefy)" })
vim.keymap.set("n", "<leader>gs", ":Shades<cr>", { desc = "Pick Color (Shades)" })
-- =============================================================================
-- LSP Keymaps
-- =============================================================================
-- (optional) keymaps – these are global, like in your original config
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })

-- Shortcut that toggles diagnostics visability
vim.keymap.set("n", "<leader>td", function()
	local current = vim.diagnostic.config().virtual_text
	vim.diagnostic.config({ virtual_text = not current })
end, { desc = "Toggle diagnostics" })

-- =============================================================================
-- Comments
-- =============================================================================
vim.keymap.set( "n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment linewise" })
