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
      },
      git = {
        ignore = false,
      },
      -- Set top folder in nvimtree
      vim.keymap.set("n", "<leader>tf", function()
        require("nvim-tree.api").tree.change_root_to_node()
      end, { desc = "Set top folder in nvi:m-tree" })
    })
    vim.keymap.set('n', '<M-h>', ':NvimTreeResize -10<cr>')
    vim.keymap.set('n', '<M-l>', ':NvimTreeResize +10<cr>')
    vim.keymap.set('n', '<M-t>', ':NvimTreeToggle<cr>')
  end
}
