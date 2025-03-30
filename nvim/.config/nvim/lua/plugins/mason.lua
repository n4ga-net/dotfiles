return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- {
  -- 	"williamboman/mason-lspconfig.nvim",
  -- 	config = function()
  -- 		require("mason-lspconfig").setup({
  -- 			ensure_installed = {
  -- 				"lua_ls",
  -- 				"ansiblels",
  -- 				"bashls",
  -- 				"cssls",
  -- 				"dockerls",
  -- 				"html",
  -- 				"jsonls",
  -- 				"pyright",
  -- 				"rust_analyzer",
  -- 				"ts_ls",
  -- 				"vimls",
  -- 				"yamlls",
  -- 				"markdown_oxide",
  -- 			},
  -- 		})
  -- 	end,
  -- },
  -- {
  -- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
  -- 	config = function()
  -- 		require("mason-tool-installer").setup({
  -- 			ensure_installed = {
  -- 				"stylua",
  -- 				"black",
  -- 				"eslint_d",
  -- 				"prettier",
  -- 				"isort",
  -- 			},
  -- 		})
  -- 	end,
  -- },
}
