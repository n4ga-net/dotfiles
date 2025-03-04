return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
    vim.keymap.set('n', '<C-Left>', ':NvimTreeResize -10<cr>')
    vim.keymap.set('n', '<C-Right>', ':NvimTreeResize +10<cr>')
    vim.keymap.set('n', '<M-t>', ':NvimTreeToggle<cr>')
  end
}
