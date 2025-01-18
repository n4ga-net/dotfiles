-- Basic Vim Settin
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.transparent_window = true
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true
vim.opt.clipboard = 'unnamedplus'


-- Keymappings
lvim.keys.normal_mode["<C-f>"] = ":Telescope find_files<cr>"
lvim.keys.normal_mode["<C-A-Left>"] = ":NvimTreeResize -10<cr>"
lvim.keys.normal_mode["<C-A-Right>"] = ":NvimTreeResize +10<cr>"
lvim.keys.normal_mode["<M-t>"] = ":NvimTreeToggle<cr>"
lvim.keys.normal_mode["o"] = ":NvimTreeFocus<cr>"

-- Plugins
lvim.plugins = {
  {
    "github/copilot.vim",
  },
}

-- Copilot
local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  suggestion = {
    keymap = {
      accept = "<c-l>",
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<c-h>",
    },
  },
}

-- Treesitter
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.sync_install = true
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "css",
  "html",
  "htmldjango",
  "go",
  "javascript",
  "json",
  "lua",
  "markdown",
  "php",
  "python",
  "make",
  "rust",
  "sql",
  "terraform",
  "toml",
  "tsx",
  "typescript",
  "yaml",
}
lvim.builtin.treesitter.ignore_install = {
  "haskell"
}
