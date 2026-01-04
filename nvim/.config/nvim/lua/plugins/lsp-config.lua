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
        -- Make diagnostics visible
      vim.diagnostic.config({
        virtual_text = true,       -- inline text next to the code
        signs = true,              -- gutter signs
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })
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
		end,
	},
}
