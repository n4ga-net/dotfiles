return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      filters = {
        dotfiles = false,
      }
    })
    vim.keymap.set('n', '<M-h>', ':NvimTreeResize -10<cr>')
    vim.keymap.set('n', '<M-l>', ':NvimTreeResize +10<cr>')
    vim.keymap.set('n', '<M-t>', ':NvimTreeToggle<cr>')
  end
}
