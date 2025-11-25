return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ansiblels",
          "bashls",
          "cssls",
          "dockerls",
          "html",
          "jsonls",
          "pyright",
          "rust_analyzer",
          "ts_ls",
          "vimls",
          "yamlls",
          "markdown_oxide",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- list of servers you want
      local servers = {
        "lua_ls",
        "ansiblels",
        "bashls",
        "cssls",
        "dockerls",
        "html",
        "jsonls",
        "pyright",
        "rust_analyzer",
        "ts_ls",
        "vimls",
        "yamlls",
        "markdown_oxide",
      }

      -- extend each server config with your capabilities
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
      end

      -- enable all these servers
      vim.lsp.enable(servers)

      -- (optional) keymaps – these are global, like in your original config
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "black",
          "eslint_d",
          "prettier",
          "isort",
        },
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.prettier,
          -- null_ls.builtins.diagnostics.eslint_d,
        },
      })
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format" })
    end,
  },
}
