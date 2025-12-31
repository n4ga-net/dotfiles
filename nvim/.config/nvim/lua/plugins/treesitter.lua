return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },

  -- This makes Lazy do: require("nvim-treesitter.configs").setup(opts)
  main = "nvim-treesitter.configs",
  opts = {
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "css",
      "dockerfile",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "powershell",
      "python",
      "query",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
  },
}

