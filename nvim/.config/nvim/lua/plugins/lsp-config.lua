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
			local fleet_cmd = vim.fn.exepath("fleet-schema-gen")
			if fleet_cmd == "" then
				fleet_cmd = vim.fn.expand("~/.local/bin/fleet-schema-gen")
			end
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
				"fleet_gitops",
			}

			vim.lsp.config("fleet_gitops", {
				cmd = { fleet_cmd, "lsp" },
				filetypes = { "yaml", "yml" },
				root_dir = function(fname)
					local root = vim.fs.find({ "default.yml", "default.yaml", "teams", "lib" }, {
						path = fname,
						upward = true,
					})[1]
					return root and vim.fs.dirname(root) or nil
				end,
				capabilities = capabilities,
			})

			-- extend each server config with your capabilities
			for _, server in ipairs(servers) do
				if server ~= "fleet_gitops" then
					vim.lsp.config(server, {
						capabilities = capabilities,
					})
				end
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
