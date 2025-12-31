-- treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- use latest
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    ensure_installed = {
      "markdown",
      "bash",
      "powershell",
      "python",
      "json",
      "xml",
    },
    sync_install = false,        -- install parsers asynchronously
    auto_install = true,         -- install missing parsers on buffer enter
    highlight = {
      enable = true,             -- false will disable the whole extension
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

