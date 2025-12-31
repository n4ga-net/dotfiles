return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"bash",
				"powershell",
				"python",
				"json",
				"xml",
				"yaml",
				"lua",
				"vim",
				"dockerfile",
				"html",
				"css",
				"javascript",
				"typescript"
			},
		})
	end,
}
