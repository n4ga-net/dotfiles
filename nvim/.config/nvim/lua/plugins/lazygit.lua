return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>gg", ":LazyGit<cr>", { desc = "Open LazyGit" })
    vim.keymap.set("n", "<leader>gp", ":LazyGitPull<cr>", { desc = "Git Pull" })
  end,
}
