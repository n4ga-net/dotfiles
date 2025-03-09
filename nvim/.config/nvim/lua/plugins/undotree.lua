return {
  "mbbill/undotree",
  lazy = true, -- Change to true for lazy loading
  config = function()
    vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Show Undotree" })
  end,
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Show Undotree" }
  }
}
