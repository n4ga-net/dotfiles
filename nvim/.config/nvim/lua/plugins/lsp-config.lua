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
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.ansiblels.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.dockerls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })
			lspconfig.vimls.setup({ capabilities = capabilities })
			lspconfig.yamlls.setup({ capabilities = capabilities })
			lspconfig.markdown_oxide.setup({ capabilities = capabilities })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "Code Action" })
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"black",
					"eslint",
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
					null_ls.builtins.diagnostics.black,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.formatting.prettier,
				},
			})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format" })
		end,
	},
}
